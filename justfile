set dotenv-filename := ".env"
set dotenv-load := true
set dotenv-required := true

mod apply
mod check
mod install
mod get
mod play

# list available recipes
default:
    @just --list

alias help := default

# apply manifests
[group("k8s")]
k8s action="apply" dir="manifests":
    kubectl kustomize --enable-helm {{ dir }} | kubectl {{ action }} -f -

alias kube := k8s

# run prettier
[group("lint")]
prettier:
    pnpm prettier --write .

alias format := prettier

# run yamllint
[group("lint")]
yamllint:
    uv run yamllint .

# run ansible-lint
[group("lint")]
ansible-lint:
    uv run ansible-lint

# run kube-linter
[group("lint")]
kube-linter:
    kube-linter lint --config .kube-linter.yaml manifests

# run all linters
[group("lint")]
lint: prettier yamllint ansible-lint kube-linter
