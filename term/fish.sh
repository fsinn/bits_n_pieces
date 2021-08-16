#!/usr/bin/env bash

# set -x
set -e

bak_dir="$HOME"/.bits_n_pieces/bak
bak_shell="$SHELL"

function setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' CYAN='\033[0;36m'
  else
    NOFORMAT='' RED='' CYAN=''
  fi
}

function log_info() {
    echo -e "${CYAN}${1}${NOFORMAT}"
}

function log_error() {
    echo -e "${RED}${1}${NOFORMAT}"
}

function cleanup() {
    log_error "${1}"
    chsh -s "$bak_shell"
    sudo cp "$bak_dir"/shells.bak /etc/shells

    exit 1;
}

function backup() {
    log_info "Backing up files to ${bak_dir}..."

    mkdir -p "$bak_dir"
    sudo cp /etc/shells "$bak_dir"/shells.bak
}

function install() {
    log_info "Installing fish and setting it as default shell (old: ${bak_shell})..."

    brew install -q fish
    which fish | sudo tee -a /etc/shells >/dev/null || cleanup "Adding fish to /etc/shells failed"
    chsh -s "$(which fish)" || cleanup "Making fish the default shell failed"

    log_info "Installing oh-my-fish..."
    curl -L https://get.oh-my.fish > install.fish
    fish install.fish --path=~/.local/share/omf --config=~/.config/omf --noninteractive
    rm install.fish
}

setup_colors

backup && install
