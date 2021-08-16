#!/usr/bin/env bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

bak_dir="$HOME"/.bits_n_pieces/bak
bak_shell="$SHELL"

fish_path=~/.local/share/omf
fish_config=~/.config/omf

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
    which fish | sudo tee -a /etc/shells >/dev/null
    chsh -s "$(which fish)"

    log_info "Installing oh-my-fish..."
    curl -L https://get.oh-my.fish > install.fish
    fish install.fish --noninteractive --path=${fish_path} --config=${fish_config}
    rm install.fish
}

function configure() {
    log_info "Configuring fish..."

    curl -L https://iterm2.com/shell_integration/fish -o ~/.iterm2_shell_integration.fish
    cp -r "${script_dir}"/omf/* ${fish_config}
}

setup_colors

backup
install || cleanup "Installing fish failed!"
configure || cleanup "Configuring fish failed!"
