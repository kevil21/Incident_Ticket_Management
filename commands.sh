kevil@NVWWMK-662FF940 Incident_Ticket_Management % fish
Welcome to fish, the friendly interactive shell
Type help for instructions on how to use fish
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> ls
LICENSE    README.md
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> touch .gitignore
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> touch instructions.txt
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> touch index_data.py
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> 
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> 
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> ls
index_data.py     instructions.txt  LICENSE           README.md
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> mkdir data
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> touch commands.sh
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> 
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> touch commands.sh
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> mkdir visualizations
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> ls
commands.sh       data/             data.ipynb        index_data.py     instructions.txt  LICENSE           README.md         visualizations/
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (main)> 



kevil@NVWWMK-662FF940 Incident_Ticket_Management % fish
Welcome to fish, the friendly interactive shell
Type help for instructions on how to use fish
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git branch
* dev
  main
  stage
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git push
fatal: The current branch dev has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin dev

To have this happen automatically for branches without a tracking
upstream, see 'push.autoSetupRemote' in 'git help config'.

kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev) [128]> git fetch
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git branch
* dev
  main
  stage
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git status
On branch dev
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        deleted:    .gitattributes

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        .env
        .gitignore
        .ipynb_checkpoints/
        data/
        data_cleaning.ipynb
        index_data.py
        instructions.txt
        requirements.txt

no changes added to commit (use "git add" and/or "git commit -a")
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git add .
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git status
On branch dev
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        deleted:    .gitattributes
        new file:   .gitignore
        new file:   commands.sh
        new file:   data/dummy_incident_tickets.csv
        new file:   data/dummy_incident_tickets_cleaned.csv
        new file:   data_cleaning.ipynb
        new file:   index_data.py
        new file:   instructions.txt
        new file:   requirements.txt

kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git commit -m "v1.0.0 Cleaned Data"
[dev 8e432f2] v1.0.0 Cleaned Data
 9 files changed, 2326 insertions(+), 2 deletions(-)
 delete mode 100644 .gitattributes
 create mode 100644 .gitignore
 create mode 100644 commands.sh
 create mode 100644 data/dummy_incident_tickets.csv
 create mode 100644 data/dummy_incident_tickets_cleaned.csv
 create mode 100644 data_cleaning.ipynb
 create mode 100644 index_data.py
 create mode 100644 instructions.txt
 create mode 100644 requirements.txt
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git tag -a v1.0.0 -m "Release version v1.0.0"
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git push -u origin dev
Enumerating objects: 12, done.
Counting objects: 100% (12/12), done.
Delta compression using up to 10 threads
Compressing objects: 100% (10/10), done.
Writing objects: 100% (11/11), 19.49 KiB | 4.87 MiB/s, done.
Total 11 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (1/1), done.
remote: 
remote: Create a pull request for 'dev' on GitHub by visiting:
remote:      https://github.com/kevil21/Incident_Ticket_Management/pull/new/dev
remote: 
To https://github.com/kevil21/Incident_Ticket_Management.git
 * [new branch]      dev -> dev
branch 'dev' set up to track 'origin/dev'.
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git push origin --tags
Enumerating objects: 1, done.
Counting objects: 100% (1/1), done.
Writing objects: 100% (1/1), 171 bytes | 171.00 KiB/s, done.
Total 1 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To https://github.com/kevil21/Incident_Ticket_Management.git
 * [new tag]         v1.0.0 -> v1.0.0
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git fetch
From https://github.com/kevil21/Incident_Ticket_Management
 * [new branch]      stage      -> origin/stage
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git fetch
remote: Enumerating objects: 2, done.
remote: Counting objects: 100% (2/2), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 2 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
Unpacking objects: 100% (2/2), 1.77 KiB | 362.00 KiB/s, done.
From https://github.com/kevil21/Incident_Ticket_Management
   90242d0..330c5ee  main       -> origin/main
   90242d0..432c6b5  stage      -> origin/stage
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git ststus
git: 'ststus' is not a git command. See 'git --help'.

The most similar command is
        status
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev) [1]> git status
On branch dev
Your branch is up to date with 'origin/dev'.

nothing to commit, working tree clean



/opt/homebrew/bin/python3.11 /Users/kevil/Library/CloudStorage/OneDrive-kyndryl/Desktop/KP/Training/03-Nov-25/Incident_Ticket_Management/index_data.py
kevil@NVWWMK-662FF940 Incident_Ticket_Management % /opt/homebrew/bin/python3.11 /Users/kevil/Library/CloudStorage/OneDrive-kyndryl/De
sktop/KP/Training/03-Nov-25/Incident_Ticket_Management/index_data.py
2025-11-05 11:18:23,622 ERROR Missing ES_ENDPOINT or ES_API_KEY environment variables.
kevil@NVWWMK-662FF940 Incident_Ticket_Management % git status
On branch dev
Your branch is up to date with 'origin/dev'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   commands.sh
        modified:   index_data.py

no changes added to commit (use "git add" and/or "git commit -a")
kevil@NVWWMK-662FF940 Incident_Ticket_Management % /opt/homebrew/bin/python3.11 /Users/kevil/Library/CloudStorage/OneDrive-kyndryl/De
sktop/KP/Training/03-Nov-25/Incident_Ticket_Management/index_data.py
2025-11-05 11:19:52,468 INFO HEAD https://my-elasticsearch-project-c9f0a6.es.us-east-1.aws.elastic.cloud:443/ [status:200 duration:0.921s]
2025-11-05 11:19:52,716 INFO HEAD https://my-elasticsearch-project-c9f0a6.es.us-east-1.aws.elastic.cloud:443/incident-tickets-management [status:200 duration:0.248s]
2025-11-05 11:19:52,717 INFO Index 'incident-tickets-management' already exists; skipping creation.
2025-11-05 11:19:52,717 INFO Reading rows from data/dummy_incident_tickets_cleaned.csv
2025-11-05 11:19:52,717 INFO Starting bulk indexing into 'incident-tickets-management' ...
/Users/kevil/Library/CloudStorage/OneDrive-kyndryl/Desktop/KP/Training/03-Nov-25/Incident_Ticket_Management/index_data.py:162: DeprecationWarning: Passing transport options in the API method is deprecated. Use 'Elasticsearch.options()' instead.
  indexed, _ = helpers.bulk(
2025-11-05 11:19:54,747 INFO PUT https://my-elasticsearch-project-c9f0a6.es.us-east-1.aws.elastic.cloud:443/_bulk?refresh=true [status:200 duration:1.996s]
2025-11-05 11:19:54,750 INFO Bulk indexing completed. Indexed actions: 100
kevil@NVWWMK-662FF940 Incident_Ticket_Management % fish
Welcome to fish, the friendly interactive shell
Type help for instructions on how to use fish
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> 
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> 
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> git status
On branch dev
Your branch is up to date with 'origin/dev'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   commands.sh
        modified:   index_data.py

no changes added to commit (use "git add" and/or "git commit -a")
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> touch index_details.txt
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> 
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> mkdir Index_Details
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> cd Index_Details/
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/I/Index_Details (dev)> 
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/I/Index_Details (dev)> ls
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/I/Index_Details (dev)> 
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/I/Index_Details (dev)> touch index_info.json
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/I/Index_Details (dev)> 
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/I/Index_Details (dev)> touch index_data.json
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/I/Index_Details (dev)> 
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/I/Index_Details (dev)> touch index_mappings.json
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/I/Index_Details (dev)> 
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/I/Index_Details (dev)> touch index_records.json
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/I/Index_Details (dev)> 
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/I/Index_Details (dev)> cd ..
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> 
kevil@NVWWMK-662FF940 ~/L/C/O/D/K/T/0/Incident_Ticket_Management (dev)> ls
commands.sh          data_cleaning.ipynb  Index_Details/       LICENSE              requirements.txt
data/                index_data.py        instructions.txt     README.md            visualizations/



