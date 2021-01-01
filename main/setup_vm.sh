#!/bin/bash
echo "Checking For Root Previlages"
if [[ $(sudo -l -U $USER) == *"(ALL) ALL"* ]]
 then
	echo "Root Previlages are available!!"
	echo " Creating Servera"
	sudo virt-install -n servera --os-type=Linux --os-variant=centos8 --memory=1024 --vcpus=1 --disk path=/var/lib/libvirt/images/servera.gcow2,bus=virtio,size=10 --nographics --location=./centos.iso --network bridge=virbr1 --initrd-inject=./config_files/servera.cfg --noautoconsole --extra-args="ks=file:/servera.cfg console=ttyS0" 
	sleep 180
	 echo " Creating Serverb"
	 sudo virt-install -n serverb --os-type=Linux --os-variant=centos8 --memory=1024 --vcpus=1 --disk path=/var/lib/libvirt/images/serverb.gcow2,bus=virtio,size=10 --nographics --location=./centos.iso --network bridge=virbr1 --initrd-inject=./config_files/serverb.cfg --noautoconsole --extra-args="ks=file:/serverb.cfg console=ttyS0" 
	sleep 180
	 echo " Creating Serverc"
	 sudo virt-install -n serverc --os-type=Linux --os-variant=centos8 --memory=1024 --vcpus=1 --disk path=/var/lib/libvirt/images/serverc.gcow2,bus=virtio,size=10 --nographics --location=./centos.iso --network bridge=virbr1 --initrd-inject=./config_files/serverc.cfg --noautoconsole --extra-args="ks=file:/serverc.cfg console=ttyS0" 
	sleep 180
	 echo " Creating Serverd"
	 sudo virt-install -n serverd --os-type=Linux --os-variant=centos8 --memory=1024 --vcpus=1 --disk path=/var/lib/libvirt/images/serverd.gcow2,bus=virtio,size=10 --nographics --location=./centos.iso --network bridge=virbr1 --initrd-inject=./config_files/serverd.cfg --noautoconsole --extra-args="ks=file:/serverd.cfg console=ttyS0" 
	echo ""
	echo "=======Instructions======"
	echo "Open Virtual Machine Manager to open console of your VM and check your installation progress OR if VM is in shutdown state than installation is finished.."
	echo "Once installation finishes of all VMs run 'run_after_vm_installation.sh' to take snapshots of the VM and apply some fixes to VM."
	echo ""
	echo "You can manage your VMs by 'vm-controls' command"
	echo "eg. vm-controls [start|stop|reboot|reset] [servera|serverb|serverc|serverd|all]"
	echo "" 
	
	
else
	echo "Root Previlages are not available. Make Sure you are having Root Previlages!!!!"
fi
