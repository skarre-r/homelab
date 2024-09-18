# homelab

## tl;dr

pre-reqs:

-   python 3.12 (or newer)
-   rye

1. install python dependencies

```shell
rye sync
```

2. configure environment variables

```shell
cp .env.example .env
vim .env
```

3. bootstrap host

```shell
make bootstrap-rpi1
```

4. run ansible playbook(s)

```shell
make rpi1
```

## hosts

| hostname | ip address      | description                                     | role              |
| -------- | --------------- | ----------------------------------------------- | ----------------- |
| rpi1     | 192.168.1.11/24 | raspberry pi 4 w/ raspberry pi os lite (64-bit) | pi-hole + unbound |
| proxmox  | 192.168.1.21/24 |                                                 |                   |

## resources

-   [https://www.makeuseof.com/how-to-boot-raspberry-pi-ssd-permanent-storage/](https://www.makeuseof.com/how-to-boot-raspberry-pi-ssd-permanent-storage/)
