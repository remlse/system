#!/bin/bash

url_prefix="https://extensions.gnome.org/extension-data"
zip_postfix="shell-extension.zip"
extensions_dir="$HOME/.local/share/gnome-shell/extensions"

[ -d $extensions_dir ] || mkdir -p $extensions_dir

install_extension() {
    name=$1
    host=$2
    version=$3

    if ls $extensions_dir | grep $name &> /dev/null ; then
        return
    fi

    file_name="$name$host.v$version.$zip_postfix"

    wget -q "$url_prefix/$file_name"
    mkdir $extensions_dir/tmp
    unzip -q "$file_name" -d $extensions_dir/tmp
    uuid=$(cat $extensions_dir/tmp/metadata.json | grep uuid | awk -F\" '{print $4}')
    mv $extensions_dir/tmp $extensions_dir/$uuid
    rm "$file_name"
}

# install_extension "hidetopbar" "mathieu.bidon.ca" "110"
install_extension "emoji-selector" "maestroschan.fr" "23"

dconf write /org/gnome/shell/enabled-extensions "[
    'emoji-selector@maestroschan.fr'
    ]"

# hidetopbar settings
# dconf write /org/gnome/shell/extensions/hidetopbar/enable-intellihide false
# dconf write /org/gnome/shell/extensions/hidetopbar/enable-active-window false
# dconf write /org/gnome/shell/extensions/hidetopbar/hot-corner true
