
# list available check recipes
default:
    @just --list --justfile check.just

alias help := default

# TODO: make sure cilium cli is installed

cilium:
    cilium status -n cilium
