#!/usr/bin/env nu

cd $'($env.HOME)/repos/system/setup'

./install/main.sh

./hardware.sh

./configure/main.sh

./git_repos.sh
