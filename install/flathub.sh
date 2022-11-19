#!/bin/bash

echo "Installing programs via flathub..."

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

packages=(
    org.telegram.desktop
    md.obsidian.Obsidian
    nz.mega.MEGAsync
)

flatpak install --noninteractive flathub ${packages[@]}

flatpak override --user --env=OBSIDIAN_USE_WAYLAND=1 md.obsidian.Obsidian
flatpak override --user nz.mega.MEGAsync --filesystem=$HOME/xdg
