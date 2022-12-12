#!/bin/bash

echo "Installing media codecs..."

sudo dnf groupupdate -yq multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate -yq sound-and-video

echo "Installing programs..."

packages=(
    # programming languages
    # rust is installed via rustup
    golang
    nodejs yarnpkg
    python3-pip

    docker-ce docker-ce-cli containerd.io docker-compose-plugin

    # dependencies
    # difftastic
    gcc-c++
    # cargo-edit (removed, keep anyway?)
    openssl-devel
    # cargo-generate
    perl-FindBin
    perl-File-Compare
    # starship
    cmake

    # text editors
    neovim
    micro wl-clipboard
    helix

    # terminal, prompt, shell
    alacritty
    starship
    zsh util-linux-user
    nushell

    # utils
    htop
    btop
    fd-find
    sd
    tealdeer
    ripgrep
    lazygit
    just
    gh
    # TODO zoxide
)

sudo dnf install -yq ${packages[@]}

if [ -z ${HEADLESS+x} ]
then
    sudo dnf install -yq code
fi
