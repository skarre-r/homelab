# homelab

## tl;dr

pre-reqs:

- python 3.12 (or newer)
- uv

1. install python dependencies (ansible)

```shell
uv sync
```

2. activate virtual environment

```shell
source .venv/bin/activate
# or, for example
source .venv/bin/activate.fish
```

3. configure environment variables

```shell
cp .env.example .env
vim .env
```

4. bootstrap host

```shell
make bootstrap-rpi1
```

5. run ansible playbook(s)

```shell
make rpi1
```

## hosts

| hostname | ip address      | description    | role              |
| -------- | --------------- | -------------- | ----------------- |
| rpi1     | 192.168.1.11/24 | raspberry pi 5 | pi-hole + unbound |
| homelab  | 192.168.1.21/24 |                | k8s               |
