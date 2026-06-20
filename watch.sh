#!/usr/bin/env bash
# rerun a command every time files in the current dir change
# needs inotifywait (inotify-tools). usage: ./watch.sh "make test"

set -euo pipefail
cmd="${1:?usage: watch.sh \"command\"}"

while true; do
  clear; eval "$cmd"
  inotifywait -qq -r -e modify,create,delete .
done