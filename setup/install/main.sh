#!/bin/bash

echo "Performing system update..."
sudo dnf update -yq

cd $'($env.HOME)/repos/system/setup/install'

./dnf_conf.sh
./dnf_repos.sh
./dnf_install.sh
./rust.sh
./bin.nu

if [ -z ${HEADLESS+x} ]
then
    ./flathub.sh
fi
