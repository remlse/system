#!/bin/bash

# set hostname
if [ "$(hostname)" = "fedora" ]
then
    echo "Enter a new hostname:"
    read new_hostname
    hostnamectl set-hostname $new_hostname
fi

old_hosts=$(cat /etc/hosts | grep "127.0.0.1")

if ! echo $old_hosts | grep $HOSTNAME &> /dev/null
then
    sudo sed -i "s/$old_hosts\$/$old_hosts $HOSTNAME/g" /etc/hosts
fi
