#!/bin/bash

echo 'stop m3'

set -e

if [ -f /var/run/m3.pid ]; then
  pid=`cat /var/run/m3.pid`
  echo $pid
    if [ -d /proc/$pid ]; then
      kill -9 $pid
    fi
fi