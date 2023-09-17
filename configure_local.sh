#!/bin/bash
set -e

source source.me

ansible-galaxy collection install -f einfachit.epic
ansible-playbook --connection=local --inventory inventory_prod --limit $(hostname) einfachit.epic.configure_epicraspberries
