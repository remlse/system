#!/bin/bash

echo "Installing git, node and Bitwarden CLI..."
sudo dnf install -yq git nodejs
command -v bw > /dev/null || sudo npm install -g @bitwarden/cli

fetch_ssh_key() {
    [ -d $HOME/.ssh ] || mkdir $HOME/.ssh

    a=remo.senekowitsch
    b=@gmail.com
    : ${BW_EMAIL=$a$b}

    # MUST LOCK VAULT AFTERWARDS TO AVOID LEAKING VALID SESSION KEY
    export BW_SESSION=$(bw login $BW_EMAIL $passwd --raw)

    bw list items --search ssh --pretty \
        | grep name \
        | awk -F '"' '{print $4}' \
        > $HOME/.ssh/id_ed25519.pub

    bw list items --search ssh --pretty \
        | grep notes \
        | awk -F '"' '{print $4}' \
        | sed 's/\\n/\n/g' \
        > $HOME/.ssh/id_ed25519
    chmod go= $HOME/.ssh/id_ed25519

    # MUST LOCK VAULT, OTHERWISE VALID SESSION KEY LEAKS INTO SHELL ENVIRONMENT
    bw lock

    ssh-add
}
fetch_ssh_key

echo "Cloning the dotfiles repo..."
export GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=accept-new"
: ${GIT_HOST=github.com}
git clone "git@$GIT_HOST:remlse/dotfiles" $HOME/dotfiles > /dev/null
git config --file $HOME/dotfiles/.git/config include.path ../.gitconfig

echo "Copying dotfiles to home directory..."
git --git-dir=$HOME/dotfiles/.git --work-tree=$HOME reset --hard > /dev/null

# ssh config MUST have those permissions exactly,
# but git only tracks executable bit of owner
[ -f $HOME/.ssh/config ] && chmod 600 $HOME/.ssh/config

echo "Installing nushell..."
sudo dnf copr enable -y
sudo dnf install nushell

# continue with regular setup
$HOME/dotfiles/setup/main.nu
echo "The system setup is done. Consider rebooting."
