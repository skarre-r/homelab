include .env
export

## host: rpi1

.PHONY: bootstrap-rpi1
bootstrap-rpi1:
	.venv/bin/ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1-bootstrap.yaml \
	--user pi --ask-pass --ask-become-pass

.PHONY: rpi1
rpi1:
	.venv/bin/ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1.yaml \
	--user ansible --extra-vars 'ansible_password={{ lookup("env", "RPI1_ANSIBLE_PASSWORD") }}'

## host: homelab

.PHONY: bootstrap-homelab
bootstrap-homelab:
	.venv/bin/ansible-playbook -vv --inventory inventory.yaml playbooks/homelab-bootstrap.yaml \
	--user homelab --ask-pass --ask-become-pass

.PHONY: homelab
homelab:
	.venv/bin/ansible-playbook -vv --inventory inventory.yaml playbooks/homelab.yaml \
	--user ansible --extra-vars 'ansible_password={{ lookup("env", "HOMELAB_ANSIBLE_PASSWORD") }}'

## tools

.PHONY: lint
lint:
	.venv/bin/ansible-lint

.PHONY: password
password:
	.venv/bin/python -c "from passlib.hash import sha512_crypt; import getpass; print(sha512_crypt.using(rounds=5000).hash(getpass.getpass()))"
