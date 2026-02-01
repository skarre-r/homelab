
# delete manifests
[macos]
default:
    #!/usr/bin/env bash
    set -euxo pipefail
    just check kubectl
    directory=$(just get manifest)
    if [[ "$directory" == "" ]]; then
        exit 1
    fi
    kubectl delete -k "manifests/${directory}/"


# list available delete recipes
[group("help")]
list:
    @just --list --justfile delete.just

alias help := list
