[private]
default:
    @just --list --justfile check.just

alias help := default
alias list := default

cilium:
    #!/usr/bin/env bash
    set -euxo pipefail
    if [[ ! `command -v cilium` ]]; then
        exit 1
    fi
    cilium status -n "cilium"

[private]
fzf:
    #!/usr/bin/env bash
    set -euxo pipefail
    if [[ ! `command -v fzf` ]]; then
        exit 1
    fi

[private]
kubectl:
    #!/usr/bin/env bash
    set -euxo pipefail
    if [[ ! `command -v kubectl` ]]; then
        exit 1
    fi
