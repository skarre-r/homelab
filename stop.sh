#!/usr/bin/env bash

# usage:
# ./stop.py [pirate | media | monitor]

docker-compose -f docker-compose.$1.yml --project-name $1 --env-file .env down
exit 0