#!/usr/bin/env bash

git fetch -p && git switch master && git pull --ff-only && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D && git switch -
