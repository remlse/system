#!/bin/bash

configure=$HOME/repos/system/setup/configure

$configure/zsh.sh
$configure/hosts.sh

$configure/gsettings.sh
$configure/xdg.sh
$configure/firefox.sh

$configure/docker.sh
$configure/vscode.sh
$configure/nerd_font.sh
$configure/gnome_ext.sh
$configure/zsa.sh

if ! [ -f /etc/profile.d/gopath.sh ]
then
    echo "export GOPATH=\$HOME/.go" | sudo tee /etc/profile.d/gopath.sh > /dev/null
    export GOPATH=$HOME/.go
fi

tldr --update &> /dev/null
