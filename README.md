# homelab

### pre-requisites

- python 3.12 (or newer)
- poetry
- opentofu
- kubectl

### python/ pyinfra

```bash
# install python dependencies
poetry shell
poetry install
```

```shell
# configure environment variables
cp .env.example .env
```

```shell
# run pyinfra
pyinfra inventory.py operations.py
```

### opentofu

```shell
# todo
```

### kubectl

```shell
# todo
```