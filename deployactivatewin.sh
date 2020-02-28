#!/bin/bash
echo "This script will help you to activate a Windows system"
echo ""

echo "Please enter the IP address of the Windows system you would like to activate"
read ipadd 

#Adding the IP address
sed -i "/10/c\\$ipadd" /home/ansible/ansible-activatewin/group_vars/hostname

echo ""
echo "Please enter the License Key in order to activate the Windows system"
read license

#Adding the URL
sed -i "/ipk/c\    win_shell: cscript slmgr.vbs /ipk ${license}" /home/ansible/ansible-activatewin/activatewin.yml

#Running the ansible playbook with the settings
ansible-playbook /home/ansible/ansible-activatewin/activatewin.yml -i /home/ansible/ansible-activatewin/group_vars/hostname
