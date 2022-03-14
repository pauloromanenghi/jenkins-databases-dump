#!/bin/bash

HOST=$1
USER=$2
PASSWORD=$3
DATABASE=$4
DATE_TIME=$(date +%F_%N)
BACKUP_PATH="/opt/postgres_backup/"

FILE_NAME=$DATABASE"_backup_"$DATE_TIME.sql

echo "Starting postgres database [$DATABASE] backup..."

PGPASSWORD=$PASSWORD pg_dump $DATABASE -h $HOST -U $USER > $BACKUP_PATH$FILE_NAME

if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
    exit 1
fi

echo "Backup has been done with success!"
