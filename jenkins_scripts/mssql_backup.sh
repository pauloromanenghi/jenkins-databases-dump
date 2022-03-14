#!/bin/bash

HOST=$1
USER=$2
PASSWORD=$3
DATABASE=$4
DATE_TIME=$(date +%F_%N)
BACKUP_PATH="/opt/mssql_backup/"

FILE_NAME=$DATABASE"_backup_"$DATE_TIME.bacpac

echo "Starting mssql database [$DATABASE] backup..."

sqlpackage /a:export /scs:"Server=$HOST;Database=$DATABASE;User Id=$USER;Password=$PASSWORD;" /tf:$BACKUP_PATH$FILE_NAME

if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
    exit 1
fi

echo "Backup has been done!"
