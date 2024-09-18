include .env
export

.PHONY: bootstrap-rpi1
bootstrap-rpi1:
	.venv/bin/ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1-bootstrap.yaml \
	--user homelab --ask-pass --ask-become-pass

.PHONY: rpi1
rpi1:
	.venv/bin/ansible-playbook -vv --inventory inventory.yaml playbooks/rpi1.yaml

.PHONY: lint
lint:
	.venv/bin/ansible-lint

.PHONY: password
password:
	.venv/bin/python -c "from passlib.hash import sha512_crypt; import getpass; print(sha512_crypt.using(rounds=5000).hash(getpass.getpass()))"
