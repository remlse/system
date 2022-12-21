#!/usr/bin/env nu

echo "Making sure prebuilt binaries are installed..."

let arch = (arch | into string | str trim)

if ($'($env.HOME)/.cargo/bin/cargo-generate' | path exists | not $in) {

    let version = 'v0.17.3'
    let filename = $'cargo-generate-($version)-($arch)-unknown-linux-gnu.tar.gz'
    wget -q $'https://github.com/cargo-generate/cargo-generate/releases/download/($version)/($filename)'
    tar xf $filename $'--directory=($env.HOME)/.cargo/bin' cargo-generate
    rm $filename
}

if ($'($env.HOME)/.cargo/bin/cargo-nextest' | path exists | not $in) {

    let version = 'cargo-nextest-0.9.43'
    let filename = $'($version)-($arch)-unknown-linux-gnu.tar.gz'
    wget -q $'https://github.com/nextest-rs/nextest/releases/download/($version)/($filename)'
    tar xf $filename $'--directory=($env.HOME)/.cargo/bin' cargo-nextest
    rm $filename
}

mkdir $'($env.HOME)/.local/bin'

if ($'($env.HOME)/.local/bin/difft' | path exists | not $in) and $arch == x86_64 {

    let version = '0.38.0'
    let filename = $'difft-($arch)-unknown-linux-gnu.tar.gz'
    wget -q $'https://github.com/Wilfred/difftastic/releases/download/($version)/($filename)'
    tar xf $filename $'--directory=($env.HOME)/.local/bin' difft
    rm $filename
}
