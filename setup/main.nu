#!/usr/bin/env nu

cd $'($env.HOME)/repos/system/setup'

./install/main.sh

./hardware.sh

./config/main.sh

./git_repos.sh
