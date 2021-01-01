#!/bin/bash
echo "This will create default instance of your virtual Machine"
sudo virsh change-media --current --eject --domain servera --path sda >/dev/null
sudo virsh change-media --current --eject --domain serverb --path sda >/dev/null
sudo virsh change-media --current --eject --domain serverc --path sda >/dev/null
sudo virsh change-media --current --eject --domain serverd --path sda >/dev/null
echo "Starting creating snapshots"
sudo virsh snapshot-create-as --domain servera --name servera_snap >/dev/null
sudo virsh snapshot-create-as --domain serverb --name serverb_snap >/dev/null
sudo virsh snapshot-create-as --domain serverc --name serverc_snap >/dev/null
sudo virsh snapshot-create-as --domain serverd --name serverd_snap >/dev/null
echo "Default instance of virtual machine created"