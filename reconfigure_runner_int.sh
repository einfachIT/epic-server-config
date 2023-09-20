#!/bin/bash
set -e

source source.me

ansible-galaxy collection install -f ../ansible-collection-epic 
ansible-playbook -i inventory_runner.yml einfachit.epic.configure_actions_runner
