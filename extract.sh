#!/usr/bin/env bash
# extract any archive by extension, no need to remember tar flags
# usage: ./extract.sh file.tar.gz

set -euo pipefail
f="${1:?usage: extract.sh <archive>}"

case "$f" in
  *.tar.bz2)  tar xjf "$f" ;;
  *.tar.gz)   tar xzf "$f" ;;
  *.tar.xz)   tar xJf "$f" ;;
  *.tar)      tar xf  "$f" ;;
  *.bz2)      bunzip2 "$f" ;;
  *.gz)       gunzip  "$f" ;;
  *.zip)      unzip   "$f" ;;
  *.rar)      unrar x "$f" ;;
  *.7z)       7z x    "$f" ;;
  *) echo "unknown archive type: $f" >&2; exit 1 ;;
esac