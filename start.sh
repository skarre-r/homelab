#!/usr/bin/env bash

# usage:
# ./start.py [pirate | media | monitor]

docker-compose -f docker-compose.$1.yml --env-file .env up -d
exit 0