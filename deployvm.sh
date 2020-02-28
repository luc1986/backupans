#!/bin/bash
# Create VM options
echo "This script will help you to create VMs in our VmWare environment"
echo ""


echo ""
echo "Please select the Datacenter on which you would like to run your VM"
PS3='Please enter your choice: '
options1=("QA" "UiPathVMs")
select opt in "${options1[@]}"
do
    case $opt in
        "QA")
            echo "you chose QA"
            sed -i "/datacenter/c\datacenter: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            S1="$opt"
            #sed -i "/clusterc\cluster: ROINFRACLUJ01" /home/ansible/ansible-vmware/group_vars/all.yml
    	    echo ""
	    echo "Please select the ESXi on which you would like to run your VM"
	    PS3='Please enter your choice: '
	options2=("roinfraesx01.uipath.local" "roinfraesx02.uipath.local" "roinfraesx03.uipath.local" "roinfraesx05.uipath.local" "roinfraesx08.uipath.local" "roinfraesx09.uipath.local" "roinfraesx10.uipath.local")
	select opt in "${options2[@]}"
	do
    	    case $opt in
                "roinfraesx01.uipath.local")
            	  echo "you chose roinfraesx01.uipath.local"
            	  sed -i "/esxhost/c\esxhost: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            	  sed -i "/datastore/c\datastore: ROQADS01" /home/ansible/ansible-vmware/group_vars/all.yml
                  break
                  ;;
        	"roinfraesx02.uipath.local")
            	  echo "you chose choice roinfraesx02.uipath.local"
                  sed -i "/esxhost/c\esxhost: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
                  sed -i "/datastore/c\datastore: ROQADS02" /home/ansible/ansible-vmware/group_vars/all.yml
                  break
                  ;;
        	"roinfraesx03.uipath.local")
            	  echo "you chose choice roinfraesx03.uipath.local"
                  sed -i "/esxhost/c\esxhost: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
                  sed -i "/datastore/c\datastore: ROQADS03" /home/ansible/ansible-vmware/group_vars/all.yml
                  break
                  ;;
        	"roinfraesx05.uipath.local")
            	  echo "you chose choice roinfraesx05.uipath.local"
            	  sed -i "/esxhost/c\esxhost: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
                  sed -i "/datastore/c\datastore: ROQADS05" /home/ansible/ansible-vmware/group_vars/all.yml
            	  break
            	  ;;
        	"roinfraesx08.uipath.local")
            	  echo "you chose choice roinfraesx08.uipath.local"
            	  sed -i "/esxhost/c\esxhost: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            	  sed -i "/datastore/c\datastore: ROQADS06" /home/ansible/ansible-vmware/group_vars/all.yml
                  break
            	  ;;
        	"roinfraesx09.uipath.local")
            	  echo "you chose choice roinfraesx09.uipath.local"
            	  sed -i "/esxhost/c\esxhost: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
                  sed -i "/datastore/c\datastore: ROQADS07" /home/ansible/ansible-vmware/group_vars/all.yml
            	  break
            	  ;;
        	"roinfraesx10.uipath.local")
            	  echo "you chose choice roinfraesx10.uipath.local"
            	  sed -i "/esxhost/c\esxhost: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
                  sed -i "/datastore/c\datastore: ROQADS08" /home/ansible/ansible-vmware/group_vars/all.yml
            	  break
            	  ;;
         	*) echo "invalid option $REPLY";;
            esac
        done
      break
      ;;
        "UiPathVMs")
            echo "you chose UiPathVMs"
            sed -i "/datacenter/c\datacenter: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            echo ""
            echo "Please select the ESXi on which you would like to run your VM"
            PS3='Please enter your choice: '
        options2=("roinfraesx16.uipath.local" "roinfraesx17.uipath.local" "roinfraesx18.uipath.local")
        select opt in "${options2[@]}"
        do
            case $opt in
                "roinfraesx16.uipath.local")
                  echo "you chose roinfraesx16.uipath.local"
                  sed -i "/esxhost/c\esxhost: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
                  sed -i "/datastore/c\datastore: ROITDS01" /home/ansible/ansible-vmware/group_vars/all.yml
                  break
                  ;;
		"roinfraesx17.uipath.local")
                  echo "you chose roinfraesx17.uipath.local"
                  sed -i "/esxhost/c\esxhost: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
                  echo ""
                  echo "Please select the appropriate datastore"
                  PS3='Please enter your choice: '
                  options3=("DS_SAS_ESXi17" "DS_SSD_ESXi17")
                  select opt in "${options3[@]}"
                  do 
                      case $opt in
                          "DS_SAS_ESXi17")
                            echo "you chose DS_SAS_ESXi17"
                            sed -i "/datastore/c\datastore: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
                            break
                            ;;
                          "DS_SSD_ESXi17")
                            echo "you chose choice DS_SSD_ESXi17"
                            sed -i "/datastore/c\datastore: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
                            break
                            ;;
                          *) echo "invalid option $REPLY";;
                     esac
                  done
                  break
                  ;;
                "roinfraesx18.uipath.local")
                  echo "you chose roinfraesx18.uipath.local"
                  sed -i "/esxhost/c\esxhost: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
                  sed -i "/datastore/c\datastore: DS_SAS_ESXi18" /home/ansible/ansible-vmware/group_vars/all.yml
                  break
                  ;;
                *) echo "invalid option $REPLY";;
              esac
           done
        break
        ;;
     *) echo "invalid option $REPLY";;
   esac
done

echo ""
echo "Please select the Template to use for your VM"
PS3='Please enter your choice: '
options4=("Template-LinC6" "Template-LinC7" "Template-LinU16" "Template-LinU18" "Template-W8.1x86_new" "Template-W81x64_Enterprise_N" "Template-WIN10-enterprisen" "Template-Win10x86" "Template-Win2008R2" "Template-Win2012R2" "Template-Win2016" "Template-Win2019" "Template-Win7" "Template-Win7x86")
select opt in "${options4[@]}"
do
    case $opt in
        "Template-LinC6")
            echo "you chose Template-LinC6"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "Template-LinC7")
            echo "you chose choice Template-LinC7"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "Template-LinU16")
            echo "you chose choice Template-LinU16"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "Template-LinU18")
            echo "you chose choice Template-LinU18"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "Template-W8.1x86_new")
            echo "you chose choice Template-W8.1x86_new"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "Template-W81x64_Enterprise_N")
            echo "you chose choice Template-W81x64_Enterprise_N"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "Template-WIN10-enterprisen")
            echo "you chose choice Template-WIN10-enterprisen"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "Template-Win10x86")
            echo "you chose choice Template-Win10x86"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "Template-Win2008R2")
            echo "you chose choice Template-Win2008R2"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "Template-Win2012R2")
            echo "you chose choice Template-Win2012R2"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "Template-Win2016")
            echo "you chose choice Template-Win2016"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "Template-Win2019")
            echo "you chose choice Template-Win2019"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "Template-Win7")
            echo "you chose choice Template-Win2019"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "Template-Win7x86")
            echo "you chose choice Template-Win7x86"
            sed -i "/vmtemplate/c\vmtemplate: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

echo ""
echo "Please select the amount of MB of RAM that you need for your VM"
PS3='Please enter your choice: '
options5=("2048" "3072" "4096" "6144" "8192")
select opt in "${options5[@]}"
do
    case $opt in
        "2048")
            echo "you chose 2048"
            sed -i "/vm_memory/c\vm_memory: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "3072")
            echo "you chose choice 3072"
            sed -i "/vm_memory/c\vm_memory: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "4096")
            echo "you chose choice 4096"
            sed -i "/vm_memory/c\vm_memory: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "6144")
            echo "you chose choice 6144"
            sed -i "/vm_memory/c\vm_memory: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "8192")
            echo "you chose choice 8192"
            sed -i "/vm_memory/c\vm_memory: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

echo ""
echo "Please select the amount of VCPUs that you need for your VM"
PS3='Please enter your choice: '
options6=("2" "4" "6" "8")
select opt in "${options6[@]}"
do
    case $opt in
        "2")
            echo "you chose 2"
            sed -i "/nr_vcpus/c\nr_vcpus: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "4")
            echo "you chose choice 4"
            sed -i "/nr_vcpus/c\nr_vcpus: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "6")
            echo "you chose choice 6"
            sed -i "/nr_vcpus/c\nr_vcpus: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "8")
            echo "you chose choice 8"
            sed -i "/nr_vcpus/c\nr_vcpus: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

echo ""
echo "Please select the amount of GB of disk space that you need for your VM"
PS3='Please enter your choice: '
options7=("70" "80" "90" "100")
select opt in "${options7[@]}"
do
    case $opt in
        "70")
            echo "you chose 70"
            sed -i "/disk_size/c\disk_size: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "80")
            echo "you chose choice 80"
            sed -i "/disk_size/c\disk_size: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "90")
            echo "you chose choice 90"
            sed -i "/disk_size/c\disk_size: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        "100")
            echo "you chose choice 100"
            sed -i "/disk_size/c\disk_size: ${opt}" /home/ansible/ansible-vmware/group_vars/all.yml
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

echo ""
echo "Do you want to install multiple VMs?"

PS3='Please enter your choice: '
options8=("yes" "no")
select opt in "${options8[@]}"
do
    case $opt in
        "yes")
            echo "you chose yes"
            echo ""
                 echo ""
                 echo "Do you want to create incremental VMs (ex. testans1 testans2 etc.) or do you want to specify multiple VM names?"

                  PS3='Please enter your choice: '
                      options9=("incremental VMs" "multiple VMs")
                      select opt in "${options9[@]}"
                      do
                          case $opt in
                              "incremental VMs")
                                  echo "you chose incremental VMs"
                                  echo ""

                                  echo "Please enter the base name that you would like to give to your VMs"
                                  read vmname
                                  echo This is the base name that you have provided to your VMs: $vmname
                                  echo ""
                                  echo "Please enter the number of VMs that you would like to create"
                                  read vmnumber
                                  echo This is the number of VMs that you would like to create: $vmnumber
                                  echo "" > /home/ansible/ansible-vmware/group_vars/hostname.yml
                                  echo -e "--- \nserverlist:" > /home/ansible/ansible-vmware/group_vars/hostname.yml
                                  for (( i=1; i<= $vmnumber; i++ ))
                                      do
                                         echo -e " - $vmname$i" >> /home/ansible/ansible-vmware/group_vars/hostname.yml

                                 done
#                                 echo "The deployment will be triggered"
#                                 ansible-playbook ansible-vmware/vmware_create_infra.yml --ask-vault-pass
                                 break
                                 ;;
                              "multiple VMs")
                                  echo "you chose multiple VMs"
                                  echo ""

                                  echo "Please enter the number of VMs that you would like to create"
                                  read vmnumber
                                  echo This is the number of VMs that you would like to create: $vmnumber
                                  echo "" > /home/ansible/ansible-vmware/group_vars/hostname.yml
                                  echo -e "--- \nserverlist:" > /home/ansible/ansible-vmware/group_vars/hostname.yml
                                  for (( i=1; i<= $vmnumber; i++ ))
                                      do
                                         echo "Please enter the name that you would like to give to your VM$i"
                                         read vmname
                                         echo -e " - $vmname" >> /home/ansible/ansible-vmware/group_vars/hostname.yml
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
            echo "Please enter the name that you would like to give to your VM"
            read vmname
            echo This is the name that you have provided to your VM: $vmname
            echo "" > /home/ansible/ansible-vmware/group_vars/hostname.yml
            echo -e "--- \nserverlist: \n - $vmname" > /home/ansible/ansible-vmware/group_vars/hostname.yml
#            echo "The deployment will be triggered"
#            ansible-playbook ansible-vmware/vmware_create_infra.yml --ask-vault-pass
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

echo ""
echo ""
echo "Here is a summary of your selection"
sed -n '2p' /home/ansible/ansible-vmware/group_vars/all.yml
sed -n '4p' /home/ansible/ansible-vmware/group_vars/all.yml
sed -n '6p' /home/ansible/ansible-vmware/group_vars/all.yml
sed -n '8p' /home/ansible/ansible-vmware/group_vars/all.yml
sed -n '9p' /home/ansible/ansible-vmware/group_vars/all.yml
sed -n '10p' /home/ansible/ansible-vmware/group_vars/all.yml
echo "VMs to be created:"
tail -n +3 /home/ansible/ansible-vmware/group_vars/hostname.yml
echo ""



echo ""
echo "Do you like to proceed?"
PS3='Please enter your choice: '
options10=("yes" "no")
select opt in "${options10[@]}"
do
    case $opt in
        "yes")
            echo "you chose yes"
            echo ""
            echo "The deployment will be triggered"
            ansible-playbook -v ansible-vmware/vmware_create_infra.yml --ask-vault-pass
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

