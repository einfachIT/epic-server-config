#!/bin/bash

source source.me

ansible-galaxy collection install -f einfachIT.epic
ansible-playbook -i inventory_prod.yml einfachit.epic.provision_raspberries
ansible-playbook -i inventory_prod.yml einfachit.epic.configure_server
ansible-playbook -i inventory_prod.yml --extra-var project_dir=$(pwd) einfachit.epic.provision_container
ansible-playbook -i inventory_prod.yml --extra-var @users_prod.yml --extra-var project_dir=$(pwd) --extra-var @secrets_prod.yml einfachit.epic.configure_container
