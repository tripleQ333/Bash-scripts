#!/usr/bin/env bash
# make a directory (with parents) and cd into it
# source it so the cd sticks:  source mkcd.sh newdir
d="${1:?usage: source mkcd.sh <dir>}"
mkdir -p "$d" && cd "$d" && pwd