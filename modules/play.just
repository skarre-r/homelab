[private]
default:
    @just --list --justfile play.just

alias help := default
alias list := default

# run the "rpi1" playbook
[no-cd]
rpi1:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1.yaml --user ansible --extra-vars "ansible_password=${RPI1_ANSIBLE_PASSWORD}"

# run the "rpi1-bootstrap" playbook
[no-cd]
rpi1-bootstrap:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1-bootstrap.yaml --user pi --ask-pass --ask-become-pass

# run the "homelab" playbook
[no-cd]
homelab:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab.yaml --user ansible --extra-vars "ansible_password=${HOMELAB_ANSIBLE_PASSWORD}"

# run the "homelab-bootstrap" playbook
[no-cd]
homelab-bootstrap:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab-bootstrap.yaml --user homelab --ask-pass --ask-become-pass

# run the "homelab-teardown" playbook
[no-cd]
homelab-teardown:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab-teardown.yaml --user ansible --extra-vars "ansible_password=${HOMELAB_ANSIBLE_PASSWORD}"

# run the "kubeconfig" playbook
[no-cd]
kubeconfig:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/kubeconfig.yaml --user ansible --extra-vars "ansible_password=${HOMELAB_ANSIBLE_PASSWORD}"
