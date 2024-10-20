#!/bin/bash

source source.me

ansible-galaxy collection install -f git@github.com:einfachIT/ansible-collection-epic.git
ansible-galaxy collection install -f git@github.com:einfachIT/ansible-collection-infra.git
ansible-playbook -i inventory_acc.yml einfachit.epic.provision_raspberries
ansible-playbook -i inventory_acc.yml einfachit.epic.configure_server
ansible-playbook -i inventory_acc.yml --extra-var project_dir=$(pwd) einfachit.epic.provision_container
ansible-playbook -i inventory_acc.yml --extra-var @users_acc.yml --extra-var project_dir=$(pwd) --extra-var @secrets_acc.yml einfachit.epic.configure_epicbackup
ansible-playbook -i inventory_acc.yml einfachit.piaas.configure_server
