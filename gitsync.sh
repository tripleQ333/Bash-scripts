#!/usr/bin/env bash
# stage everything, commit with a message, and push current branch
# usage: ./gitsync.sh "fix offset calc"

set -euo pipefail
msg="${1:?usage: gitsync.sh \"commit message\"}"
branch="$(git rev-parse --abbrev-ref HEAD)"

git add -A
git commit -m "$msg"
git push origin "$branch"