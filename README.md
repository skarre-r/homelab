# homelab

pre-reqs:

- python 3.12 (or newer)
- uv
- just
- kubectl
- pnpm*

```shell
# configure environment variables
cp .env.example .env
vim .env

# install dependencies (ansible)
just install

# bootstrap host (example: homelab)
just play homelab-bootstrap

# run ansible playbook(s) (example: homelab)
just play homelab

# apply kubernetes manifests
just apply ...

# run linters
just lint
```

## hosts

| hostname | ip address      | description    | role              |
| -------- | --------------- | -------------- | ----------------- |
| rpi1     | 192.168.1.11/24 | raspberry pi 5 | pi-hole + unbound |
| homelab  | 192.168.1.21/24 |                | nas, k8s          |

### k8s

#### loadbalancer ip addresses

| service         | ip address   |
|-----------------|--------------|
| argo            | 192.168.1.50 |
| plex            | 192.168.1.53 |
| calibre-web     | 192.168.1.54 |
| jellyfin        | 192.168.1.56 |
| sonarr          | 192.168.1.58 |
| radarr          | 192.168.1.59 |
| prowlarr        | 192.168.1.60 |
| gluetun         | 192.168.1.61 |
| qbittorrent     | 192.168.1.62 |
| overseerr       | 192.168.1.63 |
