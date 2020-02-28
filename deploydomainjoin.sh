#!/bin/bash
echo "This script will help you to AD domain join a system"
echo ""

echo "Please enter the IP address of the system that you want to domain join"
read ipadd

#Adding the IP address
sed -i "/10/c\\$ipadd" /home/ansible/ansible-domainjoin/group_vars/hostname


ansible-playbook /home/ansible/ansible-domainjoin/domainjoin.yml -i /home/ansible/ansible-domainjoin/group_vars/hostname --ask-vault-pass 
