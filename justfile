set dotenv-filename := ".env"
set dotenv-load := true
set dotenv-required := true

# show available commands
default:
    just --list

# run the "rpi1-bootstrap" playbook
[group("ansible")]
bootstrap-rpi1:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1-bootstrap.yaml \
        --user pi --ask-pass --ask-become-pass

# run the "rpi1" playbook
[group("ansible")]
rpi1:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1.yaml \
    --user ansible --extra-vars "ansible_password=${RPI1_ANSIBLE_PASSWORD}"

# run the "homelab-bootstrap" playbook
[group("ansible")]
bootstrap-homelab:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab-bootstrap.yaml \
    --user homelab --ask-pass --ask-become-pass

# run the "homelab" playbook
[group("ansible")]
homelab:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab.yaml \
    --user ansible --extra-vars "ansible_password=${HOMELAB_ANSIBLE_PASSWORD}"

# run the "homelab-teardown" playbook
[group("ansible")]
teardown-homelab:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab-teardown.yaml \
      --user ansible --extra-vars "ansible_password=${HOMELAB_ANSIBLE_PASSWORD}"

# apply manifests
[group("k8s")]
k8s action="apply" dir="manifests":
    kubectl kustomize --enable-helm {{ dir }} | kubectl {{ action }} -f -

alias kube := k8s

# get kubernetes-dashboard admin user bearer token
[group("k8s")]
k8s-dashboard:
    @kubectl get secret kubernetes-dashboard-admin -n kubernetes-dashboard -o jsonpath="{.data.token}" | base64 -d

# get headlamp admin user bearer token
[group("k8s")]
k8s-headlamp:
    @kubectl get secret headlamp-admin -n headlamp -o jsonpath="{.data.token}" | base64 -d

# run prettier
[group("lint")]
prettier:
    pnpm prettier --write .

# run yamllint
[group("lint")]
yaml-lint:
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
lint: prettier yaml-lint ansible-lint kube-linter
