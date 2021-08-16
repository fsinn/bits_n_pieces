#!/usr/bin/env bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

iterm_root=~/Library/ApplicationSupport/iTerm2

function setup_colors() {
    if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
        NOFORMAT='\033[0m' RED='\033[0;31m'
    else
        NOFORMAT='' RED=''
    fi
}

function log_error() {
    echo -e "${RED}${1}${NOFORMAT}"
}

if [ "$#" -ne 1 ]
then
    log_error "No username passed, aborting!"
    exit 1
fi

username="${1}"

sed "s/:ITERM_USER:/${username}/g" "${script_dir}"/iterm_profiles.json.template > "${iterm_root}"/DynamicProfiles/iterm_profiles.json
