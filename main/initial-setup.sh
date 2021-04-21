#!/bin/bash
echo "Checking For Root Previlages"
if [[ $(sudo -l -U $USER) == *"(ALL) ALL"* ]]
 then
	echo "Root Previlages are available!!"
	echo "Installing Requrired packages"
	sleep 1
	echo ""
	echo "====================="
	echo "Installing EPEL!!"
	echo "====================="
	sudo yum install epel-release -y
	echo ""
	echo "====================="
	echo "Installing Ansible!"
	echo "====================="
	sudo yum install ansible -y
	echo ""
	echo "====================="
	echo "Installing Virtual Machine!...this may take a time!! :)"
	echo "====================="
	echo ""
	sudo yum install virt-install virt-manager virt-viewer libvirt qemu-kvm libgcrypt -y
	sudo systemctl enable --now libvirtd
	sudo virsh net-define --file ./config_files/virtualNetwork.xml
	sudo virsh net-autostart --network VirtualNetwork
	sudo virsh net-start --network VirtualNetwork
	echo ""
	echo "====================="
	echo "Setting Up FTP server for repo management for Virtual Machines"
	echo "====================="
	echo ""
	sleep 1
	sudo yum install vsftpd -y
	sudo mkdir /mnt/iso
	sudo mount -o loop centos.iso /mnt/iso
	echo ""
	echo "Transfering Repos to FTP server"
	echo ""
	sudo rsync -ah --info=progress2 /mnt/iso/AppStream /var/ftp/pub/ && sudo rsync -ah --info=progress2 /mnt/iso/BaseOS /var/ftp/pub/
	sudo systemctl enable --now vsftpd.service
	sudo chmod -R 775 /var/ftp/pub
	sudo sed -in 's/anonymous_enable=NO/anonymous_enable=YES/' /etc/vsftpd/vsftpd.conf
	sudo sed -in 's/write_enable=YES/write_enable=NO/' /etc/vsftpd/vsftpd.conf
	sudo semanage boolean -m ftpd_full_access --on
	sudo firewall-cmd --zone=libvirt --permanent --add-service=ftp
	sudo firewall-cmd --zone=libvirt --permanent --add-port=21/tcp
	sudo firewall-cmd --reload
	sudo systemctl restart vsftpd
	echo ""
	echo "====================="
	echo "FTP Setup Done :)"
	echo "====================="
	echo ""
	sudo mkdir /root/.ssh
	sudo cp config_files/id_rsa /root/.ssh/ && sudo cp config_files/id_rsa.pub /root/.ssh/
	sudo chmod 500 /root/.ssh/id_rsa 
cat <<EOF | sudo tee -a /etc/hosts > /dev/null
10.2.1.11 servera servera.lab.example.com
10.2.1.12 serverb serverb.lab.example.com
10.2.1.13 serverc serverc.lab.example.com
10.2.1.14 serverd serverd.lab.example.com
10.2.1.1 workstation workstation.lab.example.com
EOF
	echo "Passwordless SSH to virtual machine enabled for root user"
	sudo cp vm-control.sh /usr/bin/vm-controls
	sudo chmod +rx /usr/bin/vm-controls
	sudo updatedb
	echo " Now run 'setup_vm script'"
	
	
else
	echo "Root Previlages are not available. Make Sure you are having Root Previlages!!!!"
fi
