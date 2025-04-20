include .env
export

## host: rpi1

.PHONY: bootstrap-rpi1
bootstrap-rpi1:
	uv run ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1-bootstrap.yaml \
	--user pi --ask-pass --ask-become-pass

.PHONY: rpi1
rpi1:
	uv run ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1.yaml \
	--user ansible --extra-vars 'ansible_password={{ lookup("env", "RPI1_ANSIBLE_PASSWORD") }}'

## host: homelab

.PHONY: bootstrap-homelab
bootstrap-homelab:
	uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab-bootstrap.yaml \
	--user homelab --ask-pass --ask-become-pass

.PHONY: homelab
homelab:
	uv run ansible-playbook -vv --inventory inventory.yaml playbooks/homelab.yaml \
	--user ansible --extra-vars 'ansible_password={{ lookup("env", "HOMELAB_ANSIBLE_PASSWORD") }}'

## tools

.PHONY: prettier
prettier:
	pnpm prettier --write .

.PHONY: yaml-lint
yaml-lint:
	uv run yamllint .

.PHONY: ansible-lint
ansible-lint:
	uv run ansible-lint

.PHONY: lint
lint: prettier yaml-lint ansible-lint
