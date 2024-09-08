include .env
export

.PHONY: play
play:
	@.venv/bin/ansible-playbook -vv -i inventory.yaml playbook.yaml
