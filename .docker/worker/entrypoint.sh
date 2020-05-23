#!/bin/sh
set -eo pipefail
cd /opt/okuna-api

sh /wait-for-it.sh $RDS_HOSTNAME:$RDS_PORT -t 60

sh /wait-for-it.sh $REDIS_HOST:$REDIS_PORT -t 60

# install pip env deps, run migrations, collect media, start the server
pip install -r requirements.txt --quiet

exec $@
