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

scp ci-demo.zip ${USER}@${HOST}:/tmp

ssh ${USER}@${HOST} /bin/bash << EOF
cp scripts/unicorn /etc/init.d/
chmod 777 /etc/init.d/unicorn
cp sciprts/ci-demo.conf /etc/nginx/conf.d/
/etc/init.d/nginx restart
ps -ef | grep unicorn | awk '{print $2}'|xargs kill -9
rm -fr /opt/works/ci-demo
mkdir -p /opt/works/ci-demo
mv /tmp/ci-demo.zip /opt/works/ci-demo
cd /opt/works/ci-demo
unzip ci-demo.zip
bundle
bundle exec rake db:migrate
bundle exec rake assets:precompile
/etc/init.d/unicorn start
EOF

