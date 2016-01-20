#!/bin/bash

echo 'stop m_a_rb'

set -e

if [ -f /var/run/m_a_rb.pid ]; then
  pid=`cat /var/run/m_a_rb.pid`
  echo $pid
    if [ -d /proc/$pid ]; then
      kill -9 $pid
    fi
fi