#!/bin/bash

set -e

USER=$1
HOST=$2

if [ $# -ne 2 ]; then
  echo usage: scripts/deploy.sh USER HOST
  exit -1
fi;

if [ ! -e "zaotai-admin.zip" ]; then
  echo "cannot find zaotai-admin.zip to deploy"
  exit -1
fi;

ssh ${USER}@${HOST} /bin/bash << EOF
echo '----------'
echo $RAILS_ENV
echo $ZT_DB_HOST
echo $ZT_DB_USER
echo $ZT_DB_PASSWORD
echo '----------'
cd /opt/works/zaotai-admin
bundle
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake assets:precompile
EOF

