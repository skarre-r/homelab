
# list available check recipes
[group("help")]
default:
    @just --list --justfile check.just

alias help := default

# check cilium status
cilium:
    #!/usr/bin/env bash
    set -euxo pipefail
    if [[ ! `command -v cilium` ]]; then
        exit 1
    fi
    cilium status -n "cilium"

# check if fzf is installed
[group("deps")]
fzf:
    #!/usr/bin/env bash
    set -euxo pipefail
    if [[ ! `command -v fzf` ]]; then
        exit 1
    fi

# check if kubectl is installed
[group("deps")]
kubectl:
    #!/usr/bin/env bash
    set -euxo pipefail
    if [[ ! `command -v kubectl` ]]; then
        exit 1
    fi
