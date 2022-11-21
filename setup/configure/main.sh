#!/bin/bash

cd $HOME/repos/system/setup/configure

./zsh.sh
./hosts.sh

./xdg.sh

./docker.sh
./nerd_font.sh
./zsa.sh

if [ -z ${HEADLESS+x} ]
then
    ./firefox.sh
    ./gsettings.sh
    ./vscode.sh
    ./gnome_ext.sh
fi

if ! [ -f /etc/profile.d/gopath.sh ]
then
    echo "export GOPATH=\$HOME/.go" | sudo tee /etc/profile.d/gopath.sh > /dev/null
    export GOPATH=$HOME/.go
fi

tldr --update &> /dev/null
