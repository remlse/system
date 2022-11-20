#!/bin/bash

echo "Setting up docker..."

if ! systemctl status docker | grep "; enabled;" &> /dev/null ; then
    sudo systemctl enable docker
fi
groups | grep docker &> /dev/null || sudo gpasswd -a $USER docker
