#!/bin/bash

set -e

ssh root@115.28.168.65 /bin/bash << EOF
cd /opt/works/m_a_rb
git pr
bundle install
whenever -w
sh scripts/restart-server.sh
EOF