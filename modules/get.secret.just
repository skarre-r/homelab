[private]
default:
    @just --list --justfile get.secret.just

alias help := default
alias list := default

argo:
    kubectl -n argocd get secret argocd-cluster -o jsonpath='{.data.admin\.password}' | base64 -d
