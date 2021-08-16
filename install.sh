#!/usr/bin/env bash

if ! command -v brew &> /dev/null
then
    cat << EOF
brew not found. Install it using

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
EOF
fi

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

("${script_dir}"/fonts/fonts.sh)
("${script_dir}"/term/fish/fish.sh)
