set dotenv-filename := ".env"
set dotenv-load := true
set dotenv-required := true

# show available commands
default:
    just --list

# ansible: run the "rpi1-bootstrap" playbook
bootstrap-rpi1:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1-bootstrap.yaml \
        --user pi --ask-pass --ask-become-pass

# ansible: run the "rpi1" playbook
rpi1:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1.yaml \
    --user ansible --extra-vars "ansible_password=${RPI1_ANSIBLE_PASSWORD}"

# ansible: run the "homelab-bootstrap" playbook
bootstrap-homelab:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab-bootstrap.yaml \
    --user homelab --ask-pass --ask-become-pass

# ansible: run the "homelab" playbook
homelab:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab.yaml \
    --user ansible --extra-vars "ansible_password=${HOMELAB_ANSIBLE_PASSWORD}"

# ansible: run the "homelab-teardown" playbook
teardown-homelab:
    uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab-teardown.yaml \
      --user ansible --extra-vars "ansible_password=${HOMELAB_ANSIBLE_PASSWORD}"

# k8s: apply manifests
k8s action="apply" dir="manifests":
    kubectl kustomize --enable-helm {{ dir }} | kubectl {{ action }} -f -

alias kube := k8s

# k8s: get kubernetes-dashboard admin user bearer token
k8s-dashboard:
    @kubectl get secret kubernetes-dashboard-admin -n kubernetes-dashboard -o jsonpath="{.data.token}" | base64 -d

# k8s: get headlamp admin user bearer token
k8s-headlamp:
    @kubectl get secret headlamp-admin -n headlamp -o jsonpath="{.data.token}" | base64 -d

# run prettier
prettier:
    pnpm prettier --write .

# run yamllint
yaml-lint:
    uv run yamllint .

# run ansible-lint
ansible-lint:
    uv run ansible-lint

# run kube-linter
kube-linter:
    kube-linter lint --config .kube-linter.yaml manifests

# run all linters
lint: prettier yaml-lint ansible-lint kube-linter
