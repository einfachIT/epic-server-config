#!/bin/bash
set -e

source source.me

ansible-galaxy collection install -f einfachit.epic
ansible-playbook -i inventory_runner.yml einfachit.epic.decommission_raspberries
ansible-playbook -i inventory_runner.yml einfachit.epic.provision_raspberries
ansible-playbook -i inventory_runner.yml einfachit.epic.configure_actions_runner
