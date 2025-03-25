# homelab

## tl;dr

pre-reqs:

- python 3.12 (or newer)
- uv

```shell
# install dependencies (ansible)
uv sync

# configure environment variables
cp .env.example .env
vim .env

# bootstrap host (example: rpi1)
make bootstrap-rpi1

# run ansible playbook(s) (example: rpi1)
make rpi1
```

## hosts

| hostname | ip address      | description    | role              |
| -------- | --------------- | -------------- | ----------------- |
| rpi1     | 192.168.1.11/24 | raspberry pi 5 | pi-hole + unbound |
| homelab  | 192.168.1.21/24 |                | k8s               |
