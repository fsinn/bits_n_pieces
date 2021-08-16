#!/usr/bin/env bash

# set -x
set -e

bak_dir="$HOME"/.bits_n_pieces/bak
bak_shell="$SHELL"

function cleanup {
    echo "$1"
    chsh -s "$bak_shell"
    sudo cp "$bak_dir"/shells.bak /etc/shells

    exit 1;
}

function backup {
    echo "Backing up files to ${bak_dir}..."

    mkdir -p "$bak_dir"
    sudo cp /etc/shells "$bak_dir"/shells.bak
}

function install {
    echo "Installing fish and setting it as default shell..."

    brew install -q fish
    which fish | sudo tee -a /etc/shells >/dev/null || cleanup "Adding fish to /etc/shells failed"
    chsh -s "$(which fish)" || cleanup "Making fish the default shell failed"
}

backup && install
