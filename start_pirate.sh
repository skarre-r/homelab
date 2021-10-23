#!/usr/bin/env bash
docker-compose -f docker-compose.pirate.yml --env-file .env.pirate up -d
exit 0