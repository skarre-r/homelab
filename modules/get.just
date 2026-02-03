[group: "modules"]
mod secret 'get.secret.just'

[private]
default:
    @just --list --justfile get.just

alias help := default
alias list := default

[no-cd]
[private]
manifest:
    #!/usr/bin/env bash
    set -euxo pipefail
    just check fzf
    directory=$(/usr/bin/find -d "manifests" -name "kustomization.yaml" | /usr/bin/sed 's/manifests//g' | /usr/bin/sed 's/\/kustomization.yaml//g' | fzf --height "~50%" --style "full")
    echo "$directory"


namespaces:
    kubectl get namespaces

alias ns := namespaces

pods ns="":
    #!/usr/bin/env bash
    set -euo pipefail
    ns="{{ ns }}"
    if [[ "${ns}" == "" ]]; then
        kubectl get pods -A
    else
        kubectl get pods -n "${ns}"
    fi

deployments ns="":
    #!/usr/bin/env bash
    set -euo pipefail
    ns="{{ ns }}"
    if [[ "${ns}" == "" ]]; then
        kubectl get deployments -A
    else
        kubectl get deployments -n "${ns}"
    fi

alias deps := deployments

services ns="":
    #!/usr/bin/env bash
    set -euo pipefail
    ns="{{ ns }}"
    if [[ "${ns}" == "" ]]; then
        kubectl get services -A
    else
        kubectl get services -n "${ns}"
    fi

alias svcs := services
