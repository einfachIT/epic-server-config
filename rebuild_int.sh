#!/bin/bash

source source.me

ansible-galaxy collection install -f  einfachit.epicserver
ansible-playbook -i inventory_int.yml einfachit.epicserver.decomission-server
ansible-playbook -i inventory_int.yml einfachit.epicserver.provision-server
ansible-playbook -i inventory_int.yml einfachit.epicserver.configure-server
ansible-playbook -i inventory_int.yml --extra-var project_dir=$(pwd) einfachit.epicserver.provision
ansible-playbook -i inventory_int.yml --vault-password-file .vaultpass --extra-var @users.yml --extra-var project_dir=$(pwd) --extra-var @secrets_int.yml einfachit.epicserver.configure
