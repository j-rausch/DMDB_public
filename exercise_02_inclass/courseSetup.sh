#!/bin/bash
apt-get install wget ca-certificates

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

apt-get update;

apt-get install -y postgresql < "/dev/null"
apt-get install -y postgresql-contrib < "/dev/null"
pg_ctlcluster 12 main start 

sudo -i -u postgres bash

psql -U postgres -c "ALTER USER postgres PASSWORD 'myPassword';"
psql -U postgres -c "CREATE DATABASE employee;"
psql -U postgres -c "CREATE DATABASE zvv;"
psql -U postgres -c "CREATE DATABASE tpch;"


cd /tmp
unzip dmdb_sql_exercise_datasets.zip


psql -U postgres employee < /tmp/employee/schema.sql
psql -d employee -U postgres -f /tmp/employee/inserts.sql


psql tpch < /tmp/tpch/schema.sql
psql -d tpch --user postgres -f /tmp/tpch/inserts.sql

psql zvv < /tmp/zvv/schema.sql
psql -d zvv --user postgres -f /tmp/zvv/insert.sql

#newline
