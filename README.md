# Homelab

Docker-compose files for running several services on a TrueNAS Scale (beta) box.

> Note: some services require additional configuration!

## Get started

1. clone repo: `git clone https://github.com/skarre-r/homelab.git; cd homelab`
2. copy .env example file: `cp .env.example .env`
3. edit .env file: `nano .env`
4. start docker-compose service: `bash start <service>`
5. stop docker-compose service `bash stop <service>`

## Services

### chat

- teamspeak (TODO)
- revolt? (TODO)
- matrix? (TODO)

### dev

- [code-server](https://hub.docker.com/r/linuxserver/code-server)

### media

- [plex](https://hub.docker.com/r/linuxserver/plex)
- [tautulli](https://hub.docker.com/r/linuxserver/tautulli)
- [overseerr](https://hub.docker.com/r/linuxserver/overseerr)
- [jellyfin](https://hub.docker.com/r/linuxserver/jellyfin)
- movienight (TODO)
- invidious? (TODO)
- piped? (TODO)

### misc

- [firefox](https://hub.docker.com/r/linuxserver/firefox)
- [freshrss](https://hub.docker.com/r/linuxserver/freshrss) (TODO)

### monitor

- [uptime-kuma](https://hub.docker.com/r/louislam/uptime-kuma)
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

- [wireguard](https://hub.docker.com/r/linuxserver/wireguard)
- [prowlarr](https://hub.docker.com/r/linuxserver/prowlarr)
- [sonarr](https://hub.docker.com/r/linuxserver/sonarr)
- [radarr](https://hub.docker.com/r/linuxserver/radarr)
- [bazarr](https://hub.docker.com/r/linuxserver/bazarr)
- [lidarr](https://hub.docker.com/r/linuxserver/lidarr)
- [readarr](https://hub.docker.com/r/linuxserver/readarr)
- [sabnzbd](https://hub.docker.com/r/linuxserver/sabnzbd)
- [transmission](https://hub.docker.com/r/linuxserver/transmission)
