#!/bin/bash
echo "This script will help you to deploy scripts on a system"
echo ""

echo "Please enter the IP address of the system on which you would like to run the script"
read ipadd 

#Adding the IP address
sed -i "/10/c\\$ipadd" /home/ansible/ansible-deployscript/group_vars/hostname

echo ""
echo "Please enter the URL for the script which you would like to run"
read url

#Adding the URL
sed -i "/      url/c\      url: $url" /home/ansible/ansible-deployscript/runningscript.yml

#Running the ansible playbook with the settings
ansible-playbook /home/ansible/ansible-deployscript/runningscript.yml -i /home/ansible/ansible-deployscript/group_vars/hostname
