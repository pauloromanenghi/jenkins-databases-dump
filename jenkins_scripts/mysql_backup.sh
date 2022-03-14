#!/bin/bash

HOST=$1
USER=$2
PASSWORD=$3
DATABASE=$4
DATE_TIME=$(date +%F_%N)
BACKUP_PATH="/opt/mysql_backup/"

FILE_NAME=$DATABASE"_backup_"$DATE_TIME.sql

echo "Starting mysql database [$DATABASE] backup..."

mysqldump -h $HOST $DATABASE -u $USER -p$PASSWORD > $BACKUP_PATH$FILE_NAME

if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
    exit 1
fi

echo "Backup has been done!"
