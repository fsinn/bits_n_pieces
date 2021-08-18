#!/usr/bin/env bash

if ! command -v brew &> /dev/null
then
    echo "Installing brew first..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Brew already installed. Skipping..."
fi

if ! command -v ansible &> /dev/null
then
    echo "Installing ansible first..."
    brew install -q ansible ansible-lint
else
    echo "Ansible already installed. Skipping..."
fi

ansible-playbook -v -K cli-playbook.yml
