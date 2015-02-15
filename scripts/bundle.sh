#!/bin/bash

set -e

USER=$1
HOST=$2

if [ $# -ne 2 ]; then
  echo usage: scripts/deploy.sh USER HOST
  exit -1
fi;

if [ ! -e "ci-demo.zip" ]; then
  echo "cannot find ci-demo.zip to deploy"
  exit -1
fi;

ssh ${USER}@${HOST} /bin/bash << EOF
cd /opt/works/ci-demo
bundle
bundle exec rake db:migrate
bundle exec rake assets:precompile
EOF

