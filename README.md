# Homelab

Docker-compose files for running several services on a TrueNAS Scale box + a couple of Raspberry Pis.

> Note: some services, like wireguard and traefik, require additional configuration!

## Get started

1. clone repo: `git clone https://github.com/skarre-r/homelab.git; cd homelab`
2. copy .env example file: `cp .env.example .env`
3. edit .env file: `nano .env`
4. start docker-compose service: `bash start <service>`
5. stop docker-compose service `bash stop <service>`

## Services

### dev

- [code-server](https://hub.docker.com/r/linuxserver/code-server)

### media

- [plex](https://hub.docker.com/r/linuxserver/plex)
- [tautulli](https://hub.docker.com/r/linuxserver/tautulli)
- [overseerr](https://hub.docker.com/r/linuxserver/overseerr)
- [jellyfin](https://hub.docker.com/r/linuxserver/jellyfin)

### monitor

- [uptime-kuma](https://hub.docker.com/r/louislam/uptime-kuma)

### proxy

- [traefik](https://hub.docker.com/_/traefik)

### vpn

- [wireguard](https://hub.docker.com/r/linuxserver/wireguard)
- [prowlarr](https://hub.docker.com/r/linuxserver/prowlarr)
- [sonarr](https://hub.docker.com/r/linuxserver/sonarr)
- [radarr](https://hub.docker.com/r/linuxserver/radarr)
- [bazarr](https://hub.docker.com/r/linuxserver/bazarr)
- [lidarr](https://hub.docker.com/r/linuxserver/lidarr)
- [readarr](https://hub.docker.com/r/linuxserver/readarr)
- [sabnzbd](https://hub.docker.com/r/linuxserver/sabnzbd)
- [transmission](https://hub.docker.com/r/linuxserver/transmission)

### web

- [traefik/whoami](https://hub.docker.com/r/traefik/whoami)
- [nginx](https://hub.docker.com/_/nginx)

## Planned services

- unbound
- [teamspeak](https://hub.docker.com/_/teamspeak)
- [movienight](https://github.com/zorchenhimer/MovieNight#docker-compose)
- [pihole](https://hub.docker.com/r/pihole/pihole)
- [grafana](https://hub.docker.com/r/grafana/grafana)
- [influxdb](https://hub.docker.com/_/influxdb)
- [chronograf](https://hub.docker.com/_/chronograf)
- [telegraf](https://hub.docker.com/_/telegraf)
- [prometheus](https://hub.docker.com/r/prom/prometheus/)
  - [graphite-exporter](https://hub.docker.com/r/prom/graphite-exporter)
  - [node-exporter](https://hub.docker.com/r/prom/node-exporter)
  - [influxdb-exporter](https://hub.docker.com/r/prom/influxdb-exporter)
  - [collectd-exporter](https://hub.docker.com/r/prom/collectd-exporter)
  - [snmp-exporter](https://hub.docker.com/r/prom/snmp-exporter)
  - [snmp-generator](https://hub.docker.com/r/prom/snmp-generator)?
  - [container-exporter](https://hub.docker.com/r/prom/container-exporter)
- [freshrss](https://hub.docker.com/r/linuxserver/freshrss)
- [piped](https://github.com/TeamPiped/Piped)?
- [invidious](https://github.com/iv-org/invidious)?
- [ddclient](https://hub.docker.com/r/linuxserver/ddclient)?
- [adguard](https://hub.docker.com/r/adguard/adguardhome)?
- [revolt](https://hub.docker.com/u/revoltchat)?
- [matrix/synapse](https://hub.docker.com/r/matrixdotorg/synapse)?
- [caddy](https://hub.docker.com/_/caddy)?
