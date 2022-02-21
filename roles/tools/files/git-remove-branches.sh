#!/usr/bin/env bash

branch="${1:-main}"

git fetch -p && git switch "${branch}" && git pull --ff-only && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D && git switch -
