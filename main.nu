#!/usr/bin/env nu

cd $'($env.HOME)/dotfiles/setup'

./install/main.sh

./hardware.sh

./config/main.sh

./git_repos.sh
