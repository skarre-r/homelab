[private]
default:
    @just --list --justfile login.just

alias help := default
alias list := default

[no-cd]
argo:
    #!/usr/bin/env bash
    set -euo pipefail
    just check argocd
    pw=$(just get secret argo)
    echo "y" | argocd login 192.168.1.50 --username admin --password "$pw" --insecure
