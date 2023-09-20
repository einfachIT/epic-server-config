#!/bin/bash
set -e

source source.me

ansible-galaxy collection install -f einfachit.epic
ansible-playbook --inventory inventory_prod --limit localhost  einfachit.epic.configure_epicraspberries
