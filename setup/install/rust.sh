#!/bin/bash

if ! command -v rustup ; then
    echo "installing rustup..."
    sh -c ". <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs) -y --no-modify-path"
fi

echo "Making sure rust is up to date..."
rustup --quiet update
