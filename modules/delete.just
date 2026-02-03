[private]
default:
    @just --list --justfile delete.just

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
    kubectl delete -k "manifests/${directory}/"
