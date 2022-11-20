#!/bin/bash

######## appearance ########

# dark mode
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"

# wallpaper
wallpaper="file://$HOME/cloud/pictures/f34_wallpaper.jpg"
gsettings set org.gnome.desktop.background picture-uri $wallpaper
gsettings set org.gnome.desktop.background picture-uri-dark $wallpaper

######## sound ########

# disable annoying system sounds
gsettings set org.gnome.desktop.sound event-sounds false
if [ -f /usr/share/sounds/gnome/default/alerts/drip.ogg ]; then
    sudo rm /usr/share/sounds/gnome/default/alerts/drip.ogg
fi

######## power ########
gsettings set org.gnome.desktop.session idle-delay 900
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false

######## displays ########

# enable fractional scaling
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# extreme night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature "uint32 1700"
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic false
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 19.0
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to 3.0

# mouse & touchpad
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag true
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag-lock true
gsettings set org.gnome.desktop.peripherals.touchpad speed 0.2

# keyboard
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:menu']"
dconf write /desktop/ibus/panel/emoji/hotkey "@as []" # was Ctrl-. which overlaps with vscode

# locale
gsettings set org.gnome.system.locale region "de_CH.UTF-8"

# app dock
dconf write /org/gnome/shell/favorite-apps "[
    'firefox.desktop',
    'code.desktop',
    'org.gnome.Terminal.desktop',
    'org.gnome.Nautilus.desktop'
    ]"

# nautilus
gsettings set org.gnome.nautilus.preferences default-folder-viewer "list-view"
