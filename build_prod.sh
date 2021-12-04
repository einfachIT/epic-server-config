#!/bin/bash

virtualenv -p python3 venv
source venv/bin/activate
pip install ansible docker

ansible-galaxy collection install -f einfachit.epic
ansible-playbook -i inventory_prod.yml einfachit.epic.configure-server
#ansible-playbook -i inventory_prod.yml --extra-var project_dir=$(pwd) einfachit.epic.provision
#ansible-playbook -i inventory_prod.yml --extra-var @users.yml --extra-var project_dir=$(pwd) --extra-var @secrets_int.yml einfachit.epic.configure
