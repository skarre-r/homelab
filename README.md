# Homelab

Docker-compose files for running several different services, configured to run on a TrueNAS Scale box.

> Note: some services require additional configuration!

## Get started

1. clone repo: `git clone https://github.com/skarre-r/homelab.git; cd homelab`
2. copy .env example file: `cp .env.example .env`
3. edit .env file: `nano .env`
4. start docker-compose service: `bash start <service>`
5. stop docker-compose service `bash stop <service>`

## Services

## chat

- teamspeak (TODO)
- revolt? (TODO)
- matrix? (TODO)

### media

- plex
- tautulli
- overseerr
- jellyfin
- movienight (TODO)
- invidious? (TODO)

### misc

- code-server (TODO)
- firefox (TODO)
- freshrss (TODO)

### monitor

- uptime-kuma
- grafana (TODO)
- influxdb (TODO)
- chronograf (TODO)
- prometheus (TODO)
- exporters (TODO)
- ...

### network

- træfik (TODO)
- unbound (TODO)
- ddclient (TODO)
- pi-hole/ adguard (TODO)

### pirate

- wireguard
- prowlarr
- sonarr
- radarr
- bazarr
- lidarr
- readarr (TODO)
- sabnzbd
- transmission
