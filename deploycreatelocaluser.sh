#!/bin/bash
echo "This script will help you to create one or multiple local users"
echo ""

echo "Please enter the IP address of the system on which you would like to create the user/users"
read ipadd 

#Adding the IP address
sed -i "/10/c\\$ipadd" /home/ansible/ansible-createlocaluser/hostname

echo ""
echo "Do you want to create multiple users?"

echo ""
PS3='Please enter your choice: '
options1=("yes" "no")
select opt in "${options1[@]}"
do
    case $opt in
        "yes")
            echo "you chose yes"
            echo ""
                 echo ""
                 echo "Do you want to create incremental users (ex. testuser1 testuser2 etc.) or do you want to specify multiple different user names?"

                  PS3='Please enter your choice: '
                      options2=("incremental users" "multiple different users")
                      select opt in "${options2[@]}"
                      do
                          case $opt in
                              "incremental users")
                                  echo "you chose incremental users"
                                  echo ""

                                  echo "Please enter the base name that you would like to give to your users"
                                  read username
                                  echo This is the base name that you have provided to your users: $username
                                  echo ""
                                  echo "Please enter the number of users that you would like to create"
                                  read usernumber
                                  echo This is the number of users that you would like to create: $usernumber                               
                                  echo "" > /home/ansible/ansible-createlocaluser/group_vars/userlist.yml
                                  echo -e "--- \nuserlist:" > /home/ansible/ansible-createlocaluser/group_vars/userlist.yml
                                  for (( i=1; i<= $usernumber; i++ ))
                                      do
                                        echo -e " - $username$i" >> /home/ansible/ansible-createlocaluser/group_vars/userlist.yml
                                 done

                                 break
                                 ;;
                              "multiple different users")
                                  echo "you chose multiple different user names"
                                  echo ""

                                  echo "Please enter the number of users that you would like to create"
                                  read usernumber
                                  echo This is the number of users that you would like to create: $usernumber
                                  echo "" > /home/ansible/ansible-createlocaluser/group_vars/userlist.yml
                                  echo -e "--- \nuserlist:" > /home/ansible/ansible-createlocaluser/group_vars/userlist.yml
                                  for (( i=1; i<= $usernumber; i++ ))
                                      do
                                         echo "Please enter the name that you would like to give to your user$i"
                                         read username
                                         echo -e " - $username" >> /home/ansible/ansible-createlocaluser/group_vars/userlist.yml
                                 done
#                                 echo "The deployment will be triggered"
#                                 ansible-playbook ansible-vmware/vmware_create_infra.yml --ask-vault-pass
                                 break
                                 ;;
                           *) echo "invalid option $REPLY";;
                      esac
                  done
            break
            ;;
        "no")
            echo "you chose choice no"
            echo ""
            echo "Please enter the name that you would like to give to your user"
            read username
            echo This is the name that you have provided to your user: $username
            echo "" > /home/ansible/ansible-createlocaluser/group_vars/userlist.yml
            echo -e "--- \nuserlist: \n - $username" > /home/ansible/ansible-createlocaluser/group_vars/userlist.yml

#            sed -i "7s/name:/name: ${username}/" /home/ansible/ansible-createlocaluser/createlocaluser.yml
#            echo "The deployment will be triggered"
#            ansible-playbook ansible-vmware/vmware_create_infra.yml --ask-vault-pass
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done


#Running the ansible playbook with the settings
ansible-playbook /home/ansible/ansible-createlocaluser/createlocaluser.yml -i /home/ansible/ansible-createlocaluser/hostname
