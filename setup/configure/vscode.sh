#!/bin/bash

echo "Making sure vscode extensions are installed..."

extensions=(
    # general
    ms-vsliveshare.vsliveshare
    eamodio.gitlens
    usernamehw.errorlens
    albert.tabout
    vscode-icons-team.vscode-icons

    # rust
    rust-lang.rust-analyzer
    vadimcn.vscode-lldb

    # typescript
    dbaeumer.vscode-eslint
    esbenp.prettier-vscode
    meganrogge.template-string-converter

    # other languages
    golang.go
    ms-python.python
    thenuprojectcontributors.vscode-nushell-lang

    # config & markup languages
    ms-azuretools.vscode-docker
    tamasfe.even-better-toml
    richie5um2.vscode-sort-json
    kokakiwi.vscode-just
)

for extension in "${extensions[@]}"; do
    if ! ls $HOME/.vscode/extensions | grep $extension &> /dev/null ; then
        echo "$extension..."
        code --install-extension $extension > /dev/null
    fi
done

echo "Making sure vscode uses wayland natively..."

# force native wayland mode, otherwise stuff is blurry with display scaling
launcher="/usr/share/applications/code.desktop"
if [ -f $launcher ] && ! cat $launcher | grep wayland &> /dev/null
then
    sudo sd 'code/code' 'code/code --enable-features=UseOzonePlatform --ozone-platform=wayland' $launcher
fi
