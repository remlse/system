#!/bin/bash

config=$HOME/dotfiles/setup/config

echo "Making sure firefox policies are set..."

[ -d /etc/firefox/policies ] || sudo mkdir /etc/firefox/policies

sudo cp $config/firefox_policies.json /etc/firefox/policies/policies.json
