#!/bin/bash
set -e

source source.me

ansible-galaxy collection install -f ../ansible-collection-epic
ansible-galaxy collection install -f ../ansible-collection-epic-infra

ansible-playbook -i inventory_prod einfachit.epic.configure_epicraspberries
