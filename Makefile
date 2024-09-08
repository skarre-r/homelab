include .env
export

.PHONY: play
play:
	@.venv/bin/ansible-playbook -i inventory.yaml playbook.yaml
