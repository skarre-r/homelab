[private]
default:
    @just --list --justfile run.just

alias help := default
alias list := default

[no-cd]
prettier:
    pnpm prettier --write .

[no-cd]
yamllint:
    uv run yamllint .

[no-cd]
ansible-lint:
    uv run ansible-lint

[no-cd]
kube-linter:
    kube-linter lint --config .kube-linter.yaml manifests
