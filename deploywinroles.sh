#!/bin/bash
echo "This script will help you to deploy Windows Server roles"
echo ""

echo "Please enter the IP address of the system on which you would like to install Windows Server roles"
read ipadd

#Adding the IP address
sed -i "/10/c\\$ipadd" /home/ansible/ansible-deploywinroles/group_vars/hostname


ansible-playbook /home/ansible/ansible-deploywinroles/deploywinroles.yml -i /home/ansible/ansible-deploywinroles/group_vars/hostname
