set dotenv-filename := ".env"
set dotenv-load := true
set dotenv-required := true

mod apply
mod check
mod delete
mod install
mod get
mod play

# list available recipes
[group("help")]
default:
    @just --list

alias help := default

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
