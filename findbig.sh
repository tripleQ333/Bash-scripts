#!/usr/bin/env bash
# list the 20 largest files under a directory, human readable
# usage: ./findbig.sh ~/Downloads

set -euo pipefail
dir="${1:-.}"
find "$dir" -type f -printf '%s\t%p\n' 2>/dev/null \
  | sort -rn | head -20 \
  | awk '{ $1=sprintf("%.1fMB", $1/1048576); print }'