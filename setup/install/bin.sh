#!/bin/bash

echo "Making sure prebuilt binaries are installed..."

if ! [ -f $HOME/.cargo/bin/cargo-generate ]
then
    wget -q https://github.com/cargo-generate/cargo-generate/releases/download/v0.17.3/cargo-generate-v0.17.3-x86_64-unknown-linux-gnu.tar.gz
    tar xf cargo-generate-v0.17.3-x86_64-unknown-linux-gnu.tar.gz --directory=$HOME/.cargo/bin cargo-generate
    rm cargo-generate-v0.17.3-x86_64-unknown-linux-gnu.tar.gz
fi

if ! [ -f $HOME/.cargo/bin/cargo-nextest ]
then
    wget -q https://get.nexte.st/latest/x86_64-unknown-linux-gnu.tar.gz
    tar xf x86_64-unknown-linux-gnu.tar.gz --directory=$HOME/.cargo/bin cargo-nextest
    rm x86_64-unknown-linux-gnu.tar.gz
fi

[ -d $HOME/.local/bin ] || mkdir $HOME/.local/bin

if ! [ -f $HOME/.local/bin/difft ]
then
    wget -q https://github.com/Wilfred/difftastic/releases/download/0.38.0/difft-x86_64-unknown-linux-gnu.tar.gz
    tar xf difft-x86_64-unknown-linux-gnu.tar.gz --directory=$HOME/.local/bin difft
    rm difft-x86_64-unknown-linux-gnu.tar.gz
fi
