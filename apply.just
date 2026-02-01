set dotenv-load := true

mod secret

# TODO: use fzf to select manifest dirs

# list available apply recipes
default:
    @just --list --justfile apply.just

alias help := default

[group("cluster")]
argocd:
    kubectl apply -k manifests/cluster/argocd/

[group("cluster")]
argocd-operator:
    kubectl apply -k manifests/cluster/argocd/operator/

[group("cluster")]
cilium:
    kubectl apply -k manifests/cluster/cilium/

[group("cluster")]
gateway-api:
    kubectl apply -k manifests/cluster/gateway-api/
