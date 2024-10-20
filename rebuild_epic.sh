#!/bin/bash
set -e

source source.me

#ansible-galaxy collection install -f git@github.com:einfachIT/ansible-collection-epic.git
#ansible-galaxy collection install -f git@github.com:einfachIT/ansible-collection-infra.git

ansible-galaxy collection install -f ../ansible-collection-epic
ansible-galaxy collection install -f ../ansible-collection-epic-infra

ansible-playbook -i inventory_epic.yml --extra-var project_dir=$(pwd) einfachit.epic.decommission_container
ansible-playbook -i inventory_epic.yml einfachit.epic.decommission_raspberries
ansible-playbook -i inventory_epic.yml einfachit.epic.provision_raspberries
ansible-playbook -i inventory_epic.yml einfachit.epic.configure_server
ansible-playbook -i inventory_epic.yml einfachit.epic.configure_epicraspberries
ansible-playbook -i inventory_epic.yml --extra-var project_dir=$(pwd) einfachit.epic.provision_container
ansible-playbook -i inventory_epic.yml --extra-var @users_acc.yml --extra-var project_dir=$(pwd) --extra-var @secrets_acc.yml einfachit.epic.configure_epicbackup
ansible-playbook -i inventory_epic.yml einfachit.piaas.configure_server
