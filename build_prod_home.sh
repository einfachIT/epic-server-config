#!/bin/bash
set -e

source source.me

ansible-galaxy collection install -f einfachit.epic
ansible-playbook -i inventory_prod einfachit.epic.provision_raspberries
ansible-playbook -i inventory_prod einfachit.epic.configure_epicraspberries
