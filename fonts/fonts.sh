#!/usr/bin/env bash

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

function install_fonts() {
    log_info "Installing nerd hack fonts..."

    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
}

setup_colors
install_fonts
