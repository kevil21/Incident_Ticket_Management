"""
Index cleaned Incident Tickets CSV into Elastic Cloud

- Input CSV: data/dummy_incident_tickets_cleaned.csv
- Index name: incident-tickets-management
- Auth: Elastic Cloud API key (via env: ES_ENDPOINT, ES_API_KEY)
"""

import os
import csv
import sys
import logging
import dotenv
from pathlib import Path
from typing import Iterator, Dict, Any

try:
    from elasticsearch import Elasticsearch, helpers
except Exception:
    print("Missing dependency 'elasticsearch'. Install with: pip install elasticsearch==8.12.1")
    raise

# ---------- Config ----------
CSV_PATH = Path("data/dummy_incident_tickets_cleaned.csv")
INDEX_NAME = "incident-tickets-management"                

# Elastic Cloud endpoint + API key
dotenv.load_dotenv()  # load from .env file
ES_ENDPOINT = os.getenv("ES_ENDPOINT")
ES_API_KEY = os.getenv("ES_API_KEY")

# ---------- Logging ----------
logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")
logger = logging.getLogger("index_data")


def get_client() -> Elasticsearch:
    es = Elasticsearch(
        ES_ENDPOINT,
        api_key=ES_API_KEY,
        request_timeout=120,
        retry_on_timeout=True,
        max_retries=3,
        verify_certs=True,
    )
    try:
        if not es.ping():
            logger.warning("Elasticsearch ping failed; check endpoint/API key.")
    except Exception as e:
        logger.warning("Ping raised an exception: %s", e)
    return es


def ensure_index(es: Elasticsearch, index_name: str) -> None:
    """
    Create index with defaults if it doesn't exist

    -> dynamic templates to map any field ending with `_dt` as a date
       and ignore malformed values (rows with 'Unknown' are ignored)
    -> Everything else is mapped using dynamic mapping
    """
    body = {
        "mappings": {
            "dynamic": True,
            "dynamic_templates": [
                {
                    "dt_dates": {
                        "match": "*_dt",
                        "mapping": {
                            "type": "date",
                            "ignore_malformed": True,
                            "format": "strict_date_optional_time||epoch_millis||yyyy-MM-dd"
                        }
                    }
                }
            ]
        }
    }

    try:
        exists = es.indices.exists(index=index_name)
    except Exception:
        exists = False

    if not exists:
        logger.info("Creating index '%s'...", index_name)
        es.indices.create(index=index_name, body=body)
    else:
        logger.info("Index '%s' already exists; skipping creation.", index_name)


def read_csv_rows(path: Path) -> Iterator[Dict[str, Any]]:
    """
    -> Stream rows from CSV as dicts (CSV to JSON conversion).
    ->  Assumes first line is header.
    """
    with path.open(newline="", encoding="utf-8") as fh:
        reader = csv.DictReader(fh)
        for row in reader:
            yield row


def normalize_row(row: Dict[str, Any]) -> Dict[str, Any]:
    """
    Convert 'Unknown' (any case/whitespace) to None to avoid mapping issues
    (especially for date/numeric fields).
    """
    out = {}
    for k, v in row.items():
        if isinstance(v, str) and v.strip().lower() == "unknown":
            out[k] = None
        else:
            out[k] = v
    return out


def actions_from_rows(rows: Iterator[Dict[str, Any]], index_name: str):
    """
    -> Turning CSV rows into bulk index actions.
    -> Use 'Ticket Number' (or fallback 'Hostname') as _id for records.
    """
    for row in rows:
        row = normalize_row(row)
        doc_id = None

        for key in ("Ticket Number", "Ticket number", "ticket_number", "ticketnumber"):
            if key in row and (row[key] or "").strip():
                doc_id = str(row[key]).strip()
                break
        if not doc_id:
            for key in ("Hostname", "hostname"):
                if key in row and (row[key] or "").strip():
                    doc_id = str(row[key]).strip()
                    break

        yield {
            "_op_type": "index",
            "_index": index_name,
            "_id": doc_id,
            "_source": row
        }


def main() -> None:
    if not ES_ENDPOINT or not ES_API_KEY:
        logger.error("Missing ES_ENDPOINT or ES_API_KEY environment variables.")
        sys.exit(3)

    if not CSV_PATH.exists():
        logger.error("CSV not found: %s", CSV_PATH.resolve())
        sys.exit(1)

    es = get_client()
    ensure_index(es, INDEX_NAME)

    logger.info("Reading rows from %s", CSV_PATH)
    rows_iter = read_csv_rows(CSV_PATH)
    actions = actions_from_rows(rows_iter, INDEX_NAME)

    logger.info("Starting bulk indexing into '%s' ...", INDEX_NAME)
    try:
        indexed, _ = helpers.bulk(
            es,
            actions,
            refresh=True,
            chunk_size=2000,
            request_timeout=120,
        )
        logger.info("Bulk indexing completed. Indexed actions: %s", indexed)
    except Exception as e:
        logger.exception("Bulk indexing failed: %s", e)
        sys.exit(2)


if __name__ == "__main__":
    main()
