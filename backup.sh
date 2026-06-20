#!/usr/bin/env bash
# timestamped backup of a file or folder into ./backups
# usage: ./backup.sh report.txt

set -euo pipefail
src="${1:?usage: backup.sh <file|dir>}"
stamp="$(date +%Y%m%d-%H%M%S)"
mkdir -p backups
dest="backups/$(basename "$src").$stamp.tar.gz"

tar czf "$dest" "$src"
echo "backed up -> $dest"