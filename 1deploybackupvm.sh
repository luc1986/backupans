#!/bin/bash
# Create VM options
echo "This script will help you to create backup for a VM in our VmWare environment"
echo ""

data=`date +"%d-%m-%y"`
sed -i '19s/.*/        name: "{{ item }}-'$data'"/' /home/ansible/1ansible-backupvm/vmware_backupvm.yml


echo ""
echo "Please select the appropriate datastore"
PS3='Please enter your choice: '
options4=("backup1" "backup2")
select opt in "${options4[@]}"
do
    case $opt in
        "backup1")
          echo "you chose backup1"
          sed -i "/datastore/c\datastore: backup1" /home/ansible/1ansible-backupvm/group_vars/all.yml
          break
          ;;
        "backup2")
          echo "you chose choice backup2"
          sed -i "/datastore/c\datastore: backup2" /home/ansible/1ansible-backupvm/group_vars/all.yml
          break
          ;;
        *) echo "invalid option $REPLY";;
    esac
done


echo ""
echo "Do you like to proceed?"
PS3='Please enter your choice: '
options5=("yes" "no")
select opt in "${options5[@]}"
do
    case $opt in
        "yes")
            echo "you chose yes"
            echo ""
            echo "The deployment will be triggered"
            ansible-playbook /home/ansible/1ansible-backupvm/vmware_backupvm.yml --ask-vault-pass
            break
            ;;
        "no")
            echo "you chose choice no"
            echo ""
            echo "Im this case no deployment will be triggered"
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
