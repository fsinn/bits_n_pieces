#!/usr/bin/env bash

if ! command -v brew &> /dev/null
then
    cat << EOF
brew not found. Install it using

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
EOF

fi

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
