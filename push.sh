#!/usr/bin/env bash
# push.sh — push from whichever repo you're standing in
set -e

# Are we inside one of your repos right now?
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  cd "$(git rev-parse --show-toplevel)"
  echo "In repo: $(basename "$(pwd)")"
else
  echo "Not in a repo. Going to the default one."
  cd ~/"QQQ's_Github/Binary-Exploitation-CTFs"
fi

branch=$(git rev-parse --abbrev-ref HEAD)

echo "Pulling latest from $branch:"
git pull origin "$branch"

echo "Staging all changes:"
git add -A

if git diff --cached --quiet; then
  echo "Nothing new to commit."
else
  echo "Committing (no message given means 'Uploaded'):"
  git commit -m "${1:-Uploaded}"
fi

echo "Pushing to $branch:"
git push origin "$branch"