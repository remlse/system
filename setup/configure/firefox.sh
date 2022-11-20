#!/bin/bash

configure=$HOME/repos/system/setup/configure

echo "Making sure firefox policies are set..."

[ -d /etc/firefox/policies ] || sudo mkdir /etc/firefox/policies

sudo cp $configure/firefox_policies.json /etc/firefox/policies/policies.json
