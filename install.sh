#!/usr/bin/env bash

BREW_BIN_PREFIX="$HOME"/homebrew/bin

if ! command -v "${BREW_BIN_PREFIX}"/brew &> /dev/null
then
    echo "Installing brew for current user..."
    (cd "$HOME" && git clone https://github.com/Homebrew/brew homebrew)
    (cd "$HOME" && eval "$(homebrew/bin/brew shellenv)" && brew update --force --quiet && chmod -R go-w "$(brew --prefix)/share/zsh")
else
    echo "Brew already installed. Skipping..."
fi

if ! command -v "${BREW_BIN_PREFIX}"/ansible &> /dev/null
then
    echo "Installing ansible..."
    "${BREW_BIN_PREFIX}"/brew install -q ansible ansible-lint
else
    echo "Ansible already installed. Skipping..."
fi

"${BREW_BIN_PREFIX}"/ansible-playbook -v -K -i hosts_local.yml "$@" cli-playbook.yml
