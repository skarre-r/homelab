
# list available play recipes
default:
    @just --list --justfile play.just

alias help := default

# run the "rpi1" playbook
[group("ansible playbooks")]
rpi1:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1.yaml --user ansible --extra-vars "ansible_password=${RPI1_ANSIBLE_PASSWORD}"

# run the "rpi1-bootstrap" playbook
[group("ansible playbooks")]
rpi1-bootstrap:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1-bootstrap.yaml --user pi --ask-pass --ask-become-pass

# run the "homelab" playbook
[group("ansible playbooks")]
homelab:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab.yaml --user ansible --extra-vars "ansible_password=${HOMELAB_ANSIBLE_PASSWORD}"

# run the "homelab-bootstrap" playbook
[group("ansible playbooks")]
homelab-bootstrap:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab-bootstrap.yaml --user homelab --ask-pass --ask-become-pass

# run the "homelab-teardown" playbook
[group("ansible playbooks")]
homelab-teardown:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab-teardown.yaml --user ansible --extra-vars "ansible_password=${HOMELAB_ANSIBLE_PASSWORD}"
