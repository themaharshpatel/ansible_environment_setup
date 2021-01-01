#!/bin/bash

if [[ $1 == "" ]] || [[ $2 == "" ]]
then
echo "Please write vm_controls [start|stop|reboot|reset] [all|servera|serverb|serverc|serverd|]in parameters"
else
if [[ $1 == "start" ]]
then
    if [[ $2 == "all" ]]
    then
    sudo virsh start --domain servera
    sudo virsh start --domain serverb
    sudo virsh start --domain serverc
    sudo virsh start --domain serverd
    else
    sudo virsh start --domain $2
    fi


elif [[ $1 == "stop" ]]
then
    if [[ $2 == "all" ]]
    then
    sudo virsh shutdown --domain servera
    sudo virsh shutdown --domain serverb
    sudo virsh shutdown --domain serverc
    sudo virsh shutdown --domain serverd
    else
    sudo virsh start --domain $2
    fi

elif [[ $1 == "reboot" ]]
then
    if [[ $2 == "all" ]]
    then
    sudo virsh reboot --domain servera
    sudo virsh reboot --domain serverb
    sudo virsh reboot --domain serverc
    sudo virsh reboot --domain serverd
    else
    sudo virsh reboot --domain $2
    fi

elif [[ $1 == "reset" ]]
then
    if [[ $2 == "all" ]]
    then
    echo "Restoring servera"
    sudo virsh snapshot-revert servera servera_snap
    echo "Restoring serverb"
    sudo virsh snapshot-revert serverb serverb_snap
    echo "Restoring serverc"
    sudo virsh snapshot-revert serverc serverc_snap
    echo "Restoring serverd"
    sudo virsh snapshot-revert serverd serverd_snap
    else
    echo "Restoring $2"
    sudo virsh snapshot-revert $2 $2_snap
    fi
fi
fi
