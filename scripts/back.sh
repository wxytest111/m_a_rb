#!/bin/bash

set -e

#env=$1

now=$(date +%Y%m%d%H)

echo "$now"

path=/opt/backup/$now
if [ ! -d $path ]; then
  mkdir -p $path
fi

mysqldump -h$M_DB_HOST -u$M_DB_USER -p$M_DB_PASSWORD $M_DB_NAME > $path/m001.sql

