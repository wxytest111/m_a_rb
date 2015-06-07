#!/bin/bash

set -e

if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi

if [ -f /var/run/m3.pid ]; then
  pid=`cat /var/run/m3.pid`
  echo $pid
    if [ -d /proc/$pid ]; then
      ps -ef | grep unicorn | grep -v grep | cut -c 9-15 | xargs kill -9
    fi
fi

bundle exec rake assets:clean assets:precompile

unicorn -c /opt/works/m3/config/unicorn.rb -D
