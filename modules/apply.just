[group: "modules"]
mod secret 'apply.secret.just'

[private]
default:
    @just --list --justfile apply.just

alias help := default
alias list := default

[no-cd]
manifests directory="":
    #!/usr/bin/env bash
    set -euxo pipefail
    just check kubectl
    directory="{{ directory }}"
    if [[ "$directory" == "" ]]; then
        directory=$(just get manifest)
    fi
    if [[ "$directory" == "" ]]; then
        exit 1
    fi
    kubectl apply -k "manifests/${directory}/"
