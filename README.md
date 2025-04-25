# homelab

## tl;dr

pre-reqs:

- python 3.12 (or newer)
- uv
- just

```shell
# install dependencies (ansible)
uv sync

# configure environment variables
cp .env.example .env
vim .env

# bootstrap host (example: homelab)
just bootstrap-homelab

# run ansible playbook(s) (example: homelab)
just homelab

# apply kubernetes manifests
just k8s

# run linters
just lint
```

## hosts

| hostname | ip address      | description    | role              |
|----------|-----------------|----------------|-------------------|
| rpi1     | 192.168.1.11/24 | raspberry pi 5 | pi-hole + unbound |
| homelab  | 192.168.1.21/24 |                | k8s               |
