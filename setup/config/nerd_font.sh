#!/bin/bash

echo "Making sure nerd fonts are installed..."

if ! [ -d /usr/share/fonts/roboto_mono ]; then
    wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip"
    sudo unzip -q RobotoMono.zip -d /usr/share/fonts/roboto_mono
    rm RobotoMono.zip
    sudo fc-cache -v
fi

profileID="$(dconf read /org/gnome/terminal/legacy/profiles:/list | cut --characters=3-38)"

dconf write "/org/gnome/terminal/legacy/profiles:/:$profileID/use-system-font" false
dconf write "/org/gnome/terminal/legacy/profiles:/:$profileID/font" "'RobotoMono Nerd Font Mono 12'"
dconf write "/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/bold-is-bright" true
