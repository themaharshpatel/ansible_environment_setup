
# Ansible Environment Setup
A basic setup which can help you for practicing RHCE: Ansible Automation Exam

---
#### Pre-Requisites:
1.	VMware Workstation 15.x.x or more
2.	CPU with 2+ cores
3.	Min 8 GB RAM
4.	80-100 GB Storage
#### Setup Instructions:
   1.	Download CentOS from Given Link. And use this file only, to avoid setup bugs. [Download](http://centos.excellmedia.net/8.3.2011/isos/x86_64/CentOS-8.3.2011-x86_64-dvd1.iso)
    2.	Clone this code to your machine.
    3.	Your working Directory should be `main` .
    4.	**[Important]** Rename CentOS iso from `CentOS.xxxxx` to `centos.iso` and move it to `main`.
    5.	Install VMware Workstation 
        1.	Create a New Virtual Machine
        2.	Keep Configuration as Follows
	           - 4 vCPU
	           - 6-8 GB RAM
	           - In CPU Section there will be three check boxes regarding Virtualization. Enable all three
	           - Storage 100GB
	           - Network Adapter NAT
	           - And use centos.iso in Ansible Scripts folder as OS installer.
        3. Base account should have root access.
 6.	Once installation is finished, transfer `main` folder to `/tmp/` folder of your **Virtual machine.**
7.	**[Important]** Now run terminal at path of `/tmp/main`. 
8.	Run Command `bash initial-setup.sh `.
9.	Once this script’s execution is completed than run `bash setup_vm.sh`
10.	This process will take time so you can access your VM’s console by Virtual Machine Manager. You can find this app in Application section.
11.	Here you will find your installation process, once all VMs are in Shutdown State this indicates that all the VMs are successfully configured. 
12.	**[Important]** Once all VM are configured run `bash run_after_vm_installation.sh`
13.	Now your ansible setup has been done
	1.	Root Password: redhat
	2.	Users: student, ansible
	3.	User Password: redhat
	4.	VM hostname and IP
		- servera: 10.2.1.11
		- serverb: 10.2.1.12
		- serverc: 10.2.1.13
		- serverd: 10.2.1.14
		- Workstation IP : 10.2.1.1


