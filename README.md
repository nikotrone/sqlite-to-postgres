# sqlite-to-postgres
This tool is intended to convert an SQLite database dump into a PostgreSQL importable dump

## Initialization
The script will look for a database dump in the main folder called `my_dump.dump` and will execute on it.
In order to obtain one you need to execute `sqlite3 SQLITE3_DUMP_FILE.sqlite3 .dump > my_dump.dump` and copy over the file to the root folder of the script

## Usage
In one shell you can execute `docker-compose up` to start up the container.

In another shell you can use `docker exec my_postgres /tmp/converter.sh` to run the script.
When the execution ends you will find your translated file into the root folder with the name `my_dump.dump`