set dotenv-load := true

mod secret

# TODO: use fzf to select manifest dirs

# apply manifests
[macos]
default:
    #!/usr/bin/env bash
    set -euxo pipefail
    just check kubectl
    directory=$(just get manifest)
    if [[ "$directory" == "" ]]; then
        exit 1
    fi
    kubectl apply -k "manifests/${directory}/"

# list available apply recipes
[group("help")]
list:
    @just --list --justfile apply.just

alias help := list

[group("cluster")]
argocd:
    @just check kubectl
    kubectl apply -k "manifests/cluster/argocd/"

[group("cluster")]
cilium:
    @just check kubectl
    kubectl apply -k "manifests/cluster/cilium/"

[group("cluster")]
gateway-api:
    @just check kubectl
    kubectl apply -k "manifests/cluster/gateway-api/"
