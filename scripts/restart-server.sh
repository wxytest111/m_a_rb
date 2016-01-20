#!/bin/bash

set -e

if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi

if [ -f /var/run/m_a_rb.pid ]; then
  pid=`cat /var/run/m_a_rb.pid`
  echo $pid
    if [ -d /proc/$pid ]; then
      ps -ef | grep unicorn | grep -v grep | cut -c 9-15 | xargs kill -9
    fi
fi

bundle exec rake assets:clean assets:precompile

unicorn -c /opt/works/m_a_rb/config/unicorn.rb -E production -D
