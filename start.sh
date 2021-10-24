#!/usr/bin/env bash

# usage:
# ./start.py [pirate | media]

docker-compose -f docker-compose.$1.yml --env-file .env.$1 up -d
exit 0