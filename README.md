# homelab

### pre-reqs

-   python 3.12 (or newer)
-   rye

### tl;dr

1. install python dependencies

```shell
rye sync
```

2. configure environment variables

```shell
cp .env.example .env
vim .env
```

3. run ansible

```shell
make ansible
# or
make playbook
# or
make play
```

## hosts

### raspberry pi #1

unbound + pi-hole

-   model: raspberry pi 4
-   os: raspberry pi os lite (64-bit)
-   hostname: rpi1
-   username: homelab
-   ip address: 192.168.1.11/24

## resources

-   [https://www.makeuseof.com/how-to-boot-raspberry-pi-ssd-permanent-storage/](https://www.makeuseof.com/how-to-boot-raspberry-pi-ssd-permanent-storage/)
