#!/bin/bash

echo "Making sure zsh is setup..."

line="[[ -o rcs ]] && export ZDOTDIR=\$HOME/.config/zsh"
if ! grep "$line" /etc/zshenv &> /dev/null ; then
    echo "$line" | sudo tee -a /etc/zshenv > /dev/null

    # ensure HEADLESS is set forever on that system
    if ! [ -z ${HEADLESS+x} ]
    then
        echo "HEADLESS=true" | sudo tee -a /etc/zshenv > /dev/null
    fi
fi

sudo chsh -s $(which zsh) $(whoami) &> /dev/null

ls $HOME/.bash* &> /dev/null && rm $HOME/.bash*
