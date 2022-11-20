#!/bin/bash

echo "Performing system update..."
sudo dnf update -yq

install=$HOME/repos/system/setup/install

$install/dnf_conf.sh
$install/dnf_repos.sh
$install/dnf_install.sh
$install/flathub.sh
$install/bin.sh
$install/rust.sh
