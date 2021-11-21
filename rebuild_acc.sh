#!/bin/bash

source source.me

ansible-galaxy collection install -f git@github.com:einfachIT/ansible-collection-epic.git
ansible-playbook -i inventory_acc.yml einfachit.epicserver.decommission_server
ansible-playbook -i inventory_acc.yml einfachit.epicserver.provision_server
ansible-playbook -i inventory_acc.yml einfachit.epicserver.configure_server
ansible-playbook -i inventory_acc.yml --extra-var project_dir=$(pwd) einfachit.epicserver.provision_container
ansible-playbook -i inventory_acc.yml --vault-password-file .vaultpass --extra-var @users.yml --extra-var project_dir=$(pwd) --extra-var @secrets_acc.yml einfachit.epicserver.configure_container
