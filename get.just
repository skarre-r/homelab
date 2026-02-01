
# list available get recipes
[group("help")]
default:
    @just --list --justfile get.just

alias help := default

# get argocd admin password secret
[group("secrets")]
argo-password:
    kubectl -n argocd get secret argocd-cluster -o jsonpath='{.data.admin\.password}' | base64 -d

# get manifest directory
[group("utils")]
[macos]
manifest:
    #!/usr/bin/env bash
    set -euxo pipefail
    just check fzf
    directory=$(/usr/bin/find -d "manifests" -name "kustomization.yaml" | /usr/bin/sed 's/manifests//g' | /usr/bin/sed 's/\/kustomization.yaml//g' | fzf --height "~50%" --style "full")
    echo "$directory"
