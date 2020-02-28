#!/bin/bash
# Create VM tags 
echo "This script will help you to create VM tags"
echo ""

echo "Do you want to create tags on multiple VMs?"

PS3='Please enter your choice: '
options1=("yes" "no")
select opt in "${options1[@]}"
do
    case $opt in
        "yes")
            echo "you chose yes"
            echo ""
            echo "Please enter the number of VMs for which you want to add tags"
            read vmnumber
            echo This is the number of VMs for which you want to add tags: $vmnumber
            echo "" > /home/ansible/ansible-vmwaretag/group_vars/hostname.yml
            echo -e "--- \nserverlist:" > /home/ansible/ansible-vmwaretag/group_vars/hostname.yml
            for (( i=1; i<= $vmnumber; i++ ))
                do
                  echo "Please enter the name of the VM$i"
                  read vmname
                  echo -e " - $vmname" >> /home/ansible/ansible-vmwaretag/group_vars/hostname.yml
             done
             break
             ;;
        "no")
            echo "you chose choice no"
            echo ""
            echo "Please enter the name of the VM"
            read vmname
            echo This is the name that you have provided to your VM: $vmname
            echo "" > /home/ansible/ansible-vmwaretag/group_vars/hostname.yml
            echo -e "--- \nserverlist: \n - $vmname" > /home/ansible/ansible-vmwaretag/group_vars/hostname.yml
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done



echo ""
echo "Please select the Tag name that you want to set for your VM"
PS3='Please enter your choice: '
options2=("Devops" "Cluj" "Orchestrator" "Robot")
select opt in "${options2[@]}"
do
    case $opt in
        "Devops")
            echo "you chose Devops"
            sed -i "/tag/c\tag: ${opt}" /home/ansible/ansible-vmwaretag/group_vars/all.yml
            break
            ;;
        "Cluj")
            echo "you chose choice Cluj"
            sed -i "/tag/c\tag: ${opt}" /home/ansible/ansible-vmwaretag/group_vars/all.yml
            break
            ;;
        "Orchestrator")
            echo "you chose choice Orchestrator"
            sed -i "/tag/c\tag: ${opt}" /home/ansible/ansible-vmwaretag/group_vars/all.yml
            break
            ;;
        "Robot")
            echo "you chose choice Robot"
            sed -i "/tag/c\tag: ${opt}" /home/ansible/ansible-vmwaretag/group_vars/all.yml
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done





echo ""
echo ""
echo "Here is a summary of your selection"

echo ""
echo "Selected Tag"
sed -n '11p' /home/ansible/ansible-vmwaretag/group_vars/all.yml
echo "VMs list"
tail -n +3 /home/ansible/ansible-vmwaretag/group_vars/hostname.yml
echo ""



echo ""
echo "Do you like to proceed?"
PS3='Please enter your choice: '
options3=("yes" "no")
select opt in "${options3[@]}"
do
    case $opt in
        "yes")
            echo "you chose yes"
            echo ""
            echo "The deployment will be triggered"
            ansible-playbook -v ansible-vmwaretag/vmware_create_tag.yml --ask-vault-pass
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

