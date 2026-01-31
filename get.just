
# list available get recipes
default:
    @just --list --justfile get.just

alias help := default

argo-password:
    kubectl -n argocd get secret argocd-cluster -o jsonpath='{.data.admin\.password}' | base64 -d
