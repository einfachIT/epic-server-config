#!/bin/bash

source source.me

#ansible-galaxy collection install -f git@github.com:einfachIT/ansible-collection-epic.git
#ansible-galaxy collection install -f git@github.com:einfachIT/ansible-collection-infra.git

ansible-galaxy collection install -f ../ansible-collection-epic
ansible-galaxy collection install -f ../ansible-collection-epic-infra

ansible-playbook -i inventory_epic.yml einfachit.epic.provision_raspberries
ansible-playbook -i inventory_epic.yml einfachit.epic.configure_server
#ansible-playbook -i inventory_epic.yml --extra-var project_dir=$(pwd) einfachit.epic.provision_container
#ansible-playbook -i inventory_epic.yml --extra-var @users_epic.yml --extra-var project_dir=$(pwd) --extra-var @secrets_epic.yml einfachit.epic.configure_epicbackup
ansible-playbook -i inventory_epic.yml einfachit.piaas.configure_server
