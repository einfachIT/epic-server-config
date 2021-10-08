#!/bin/bash

virtualenv -p python3 venv
source venv/bin/activate
pip install ansible docker

ansible-galaxy collection install -f einfachit.epicserver
ansible-playbook -i inventory_int.yml --extra-var project_dir=$(pwd) einfachit.epicserver.provision
ansible-playbook -i inventory_int.yml --vault-password-file .vaultpass --extra-var project_dir=$(pwd) --extra-var @secrets_int.yml einfachit.epicserver.configure
