#!/bin/bash
set -e

source source.me

ansible-galaxy collection install -f ../ansible-collection-epic 
ansible-playbook -i inventory_acc.yml einfachit.epic.poweron_raspberries.yml
sleep 60
ansible-playbook -i inventory_acc.yml --extra-var project_dir=$(pwd) einfachit.epic.decommission_container
ansible-playbook -i inventory_acc.yml einfachit.epic.decommission_raspberries
ansible-playbook -i inventory_acc.yml einfachit.epic.provision_raspberries
ansible-playbook -i inventory_acc.yml einfachit.epic.configure_server
ansible-playbook -i inventory_acc.yml einfachit.epic.configure_epicraspberries
ansible-playbook -i inventory_acc.yml --extra-var project_dir=$(pwd) einfachit.epic.provision_container
ansible-playbook -i inventory_acc.yml --extra-var @users_acc.yml --extra-var project_dir=$(pwd) --extra-var @secrets_acc.yml einfachit.epic.configure_epicbackup
ansible -i inventory_acc.yml raspberries -a "/sbin/shutdown -h +1" --become
sleep 90
ansible-playbook -i inventory_acc.yml einfachit.epic.poweroff_raspberries.yml
