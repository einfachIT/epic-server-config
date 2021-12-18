#!/bin/bash
set -e

source source.me

ansible-galaxy collection install -f einfachit.epic
ansible-playbook -i inventory_prod einfachit.epic.provision_raspberries
ansible-playbook -i inventory_prod einfachit.epic.configure_server
ansible-playbook -i inventory_prod --extra-var project_dir=$(pwd) einfachit.epic.provision_container
ansible-playbook -i inventory_prod --extra-var project_dir=$(pwd) --extra-var @secrets_prod.yml einfachit.epic.configure_container
