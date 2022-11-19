#!/bin/bash

echo "Making sure dnf repos are enabled..."

if ! dnf repolist | grep rpmfusion-free &> /dev/null ; then
    sudo dnf install -yq https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
fi

if ! dnf repolist | grep rpmfusion-nonfree-updates &> /dev/null ; then
    sudo dnf install -yq https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
fi

if dnf repolist | grep phracek-PyCharm &> /dev/null ; then
    sudo dnf config-manager --set-disabled phracek-PyCharm
fi

if ! dnf repolist | grep docker &> /dev/null ; then
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
fi

if ! dnf repolist | grep code &> /dev/null ; then
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
fi

copr_repos=(
    atim/lazygit
    atim/starship
    atim/nushell
    varlad/helix
)

for copr_repo in ${copr_repos[@]}
do
    if ! dnf repolist | grep $(basename $copr_repo) &> /dev/null ; then
        sudo dnf copr enable $copr_repo -y
    fi
done
