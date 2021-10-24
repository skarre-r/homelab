#!/usr/bin/env bash
docker-compose -f docker-compose.$1.yml --env-file .env.$1 down
exit 0