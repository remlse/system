#!/bin/bash

config=$HOME/dotfiles/setup/config

$config/zsh.sh
$config/hostname.sh

$config/gsettings.sh
$config/xdg.sh
$config/firefox.sh

$config/docker.sh
$config/vscode.sh
$config/nerd_font.sh
$config/gnome_ext.sh
$config/zsa.sh

if ! [ -f /etc/profile.d/gopath.sh ]
then
    echo "export GOPATH=\$HOME/.go" | sudo tee /etc/profile.d/gopath.sh > /dev/null
    export GOPATH=$HOME/.go
fi

tldr --update &> /dev/null
