include .env
export

.PHONY: ansible
ansible:
	.venv/bin/ansible-playbook -vv --inventory inventory.yaml playbook.yaml

.PHONY: playbook
playbook: ansible

.PHONY: play
play: ansible

.PHONY: rpi1
rpi1:
	.venv/bin/ansible-playbook -vv --limit rpi1 --inventory inventory.yaml playbook.yaml

.PHONY: lint
lint:
	.venv/bin/ansible-lint
