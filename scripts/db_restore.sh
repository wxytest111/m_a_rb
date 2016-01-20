#!/bin/bash

set -e

env=$1

folder=$2

cd db_backup

tar -xvf $folder.tar

cd ..

mysql -uroot $env < db_backup/$folder/m001.sql
