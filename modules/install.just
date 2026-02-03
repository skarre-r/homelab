[private]
default:
    @just --list --justfile install.just

alias help := default
alias list := default

[no-cd]
deps:
    uv sync
    pnpm install

[no-cd]
cilium:
    cilium install --namespace cilium --set k8sServiceHost=192.168.1.21 --set k8sServicePort=6443 --set kubeProxyReplacement=true --values=playbooks/files/cilium-values.yaml

[no-cd]
gateway-api:
    @just check kubectl
    kubectl apply --server-side -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.1/experimental-install.yaml
