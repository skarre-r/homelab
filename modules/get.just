[group: "modules"]
mod secret 'get.secret.just'

[private]
default:
    @just --list --justfile get.just

alias help := default
alias list := default

[no-cd]
[private]
manifests:
    #!/usr/bin/env bash
    set -euxo pipefail
    just check fzf
    directory=$(/usr/bin/find -d "manifests" -name "kustomization.yaml" | /usr/bin/sed 's/manifests//g' | /usr/bin/sed 's/\/kustomization.yaml//g' | fzf --height "~50%" --style "full")
    echo "$directory"
