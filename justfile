set dotenv-filename := ".env"
set dotenv-load := true
set dotenv-required := true

[group: "modules"]
mod apply 'modules/apply.just'
[group: "modules"]
mod check 'modules/check.just'
[group: "modules"]
mod delete 'modules/delete.just'
[group: "modules"]
mod get 'modules/get.just'
[group: "modules"]
mod install 'modules/install.just'
[group: "modules"]
mod play 'modules/play.just'
[group: "modules"]
mod run 'modules/run.just'

[private]
default:
    @just --list

alias help := default
alias list := default

select:
    @just --choose --chooser "fzf --multi --height=~50% --style full --preview 'just --unstable --color always --show {}'"

alias choose := select

[group("recipes")]
format:
    just run prettier

[group("recipes")]
lint:
    just run yamllint
    just run ansible-lint
    just run kube-linter
