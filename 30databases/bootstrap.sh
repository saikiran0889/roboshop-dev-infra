#!/bin/bash

dnf install ansible -y
ansible-pull -u https://github.com/saikiran0889/ansible-robodhop-roles-installpackages-dev-infra.git -e component=mongodb main.yaml

git clone ansible-playbook
cd ansible-playbook
ansible-playbook -i inventory mongodb.yaml