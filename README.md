# Homelab

Docker-compose files for running several services on a TrueNAS SCALE box.

> Note: some services, like wireguard and traefik, require additional configuration!

## Get started

1. clone the repo: `git clone https://github.com/skarre-r/homelab.git; cd homelab`
2. copy the .env example file: `cp .env.example .env`
3. edit the .env file: `nano .env`
4. start a docker-compose application: `bash start <application>`

## Usage

Since having multiple docker-compose files in the same directory is kind of a headache to manage,
I've made a few shell scripts to make the process easier.

To start an application, simply run `bash [start](start) <application>`.
Example: `bash start web` will start all the services configured in the `docker-compose.web.yml` file.

To stop an application, run `bash stop <application>`.

To restart an application, run `bash restart <application>`.
(`restart` just runs the `start` and `stop` scripts one after another.)

To update the container images for all services in an application, run `bash update <application>`.

Keep in mind that some applications rely on others to work correctly.
Example: [traefik](docker-compose.proxy.yml) won't work if [docker-socket-proxy](docker-compose.docker.yml) isn't running.

## Services

### Auth

- [authelia](https://hub.docker.com/r/authelia/authelia)
- [redis](https://hub.docker.com/_/redis)

### Dev

- [code-server](https://hub.docker.com/r/linuxserver/code-server) (WIP)

### Docker

- [docker-socket-proxy](https://hub.docker.com/r/tecnativa/docker-socket-proxy)

### Media

- [plex](https://hub.docker.com/r/linuxserver/plex)
- [tautulli](https://hub.docker.com/r/linuxserver/tautulli)
- [overseerr](https://hub.docker.com/r/linuxserver/overseerr)
- [jellyfin](https://hub.docker.com/r/linuxserver/jellyfin)

### Monitor

- [uptime-kuma](https://hub.docker.com/r/louislam/uptime-kuma)

### Proxy

- [traefik](https://hub.docker.com/_/traefik)

### VPN

- [wireguard](https://hub.docker.com/r/linuxserver/wireguard)
- [prowlarr](https://hub.docker.com/r/linuxserver/prowlarr)
- [sonarr](https://hub.docker.com/r/linuxserver/sonarr)
- [radarr](https://hub.docker.com/r/linuxserver/radarr)
- [bazarr](https://hub.docker.com/r/linuxserver/bazarr)
- [lidarr](https://hub.docker.com/r/linuxserver/lidarr)
- [readarr](https://hub.docker.com/r/linuxserver/readarr)
- [sabnzbd](https://hub.docker.com/r/linuxserver/sabnzbd)
- [transmission](https://hub.docker.com/r/linuxserver/transmission)

### Web

- [flame](https://hub.docker.com/r/pawelmalak/flame)
- [traefik/whoami](https://hub.docker.com/r/traefik/whoami)
- [nginx](https://hub.docker.com/_/nginx)

## Planned services

- unbound
- [portainer](https://hub.docker.com/r/portainer/portainer-ce)
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
