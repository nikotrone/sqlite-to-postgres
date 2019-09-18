#!/bin/bash
# The script converts a regular SQLite database dump into a regular
# PostgreSQL importable dump

echo "Removing PRAGMA lines..."
sed -i "/PRAGMA/d" /tmp/my_dump.dump

echo "Removing sqlite_sequence lines..."
sed -i "/sqlite_sequence/d" /tmp/my_dump.dump

echo "Fixing datetime into TIMESTAMP lines..."
sed -i "s|datetime|TIMESTAMP|g" /tmp/my_dump.dump

echo "Fixing INTEGER PRIMARY KEY AUTOINCREMENT into SERIAL PRIMARY KEY lines..."
sed -i "s|INTEGER PRIMARY KEY AUTOINCREMENT|SERIAL PRIMARY KEY|g" /tmp/my_dump.dump

##  Inline dataset manipulation
#   You can uncomment and use this section to add more inline manipulations.
#   It is commonly used to fix some mistakes in the records which are not flagged in SQLite
#   but raise issues in Postgres due to data type mismatch.
#
#   echo "Fixing buggy lines..."
#   sed -i "s|VALUES(10463,'-0004-03-06'|VALUES(10463,'2018-04-06'|g" /tmp/my_dump.dump

echo "Uploading dump to PostgreSQL..."
cat /tmp/my_dump.dump | psql -U postgres > log.txt  

echo "Success!"
