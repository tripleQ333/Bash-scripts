#!/usr/bin/env bash
# status.sh — quick read on the repo: anything to push? (read-only)
set -e

echo "Finding the repo:"
cd "$(git rev-parse --show-toplevel)"
branch=$(git rev-parse --abbrev-ref HEAD)
echo "In repo: $(basename "$(pwd)")  on branch: $branch"

echo "Checking the remote (nothing is changed):"
git fetch --quiet origin "$branch" 2>/dev/null || echo "Could not reach remote; counts are local-only."

echo "Comparing local vs remote:"
ahead=$(git rev-list --count "origin/$branch..$branch" 2>/dev/null || echo "?")
behind=$(git rev-list --count "$branch..origin/$branch" 2>/dev/null || echo "?")
echo "  Commits to push:        $ahead"
echo "  Commits behind remote:  $behind"

echo "Checking for uncommitted changes:"
if [ -z "$(git status --porcelain)" ]; then
  echo "  Working tree is clean."
else
  git status --short
fi

echo "Verdict:"
if [ "$ahead" != "0" ] && [ "$ahead" != "?" ]; then
  echo "  You have $ahead commit(s) to push. Run push.sh"
elif [ -n "$(git status --porcelain)" ]; then
  echo "  You have uncommitted changes. Run push.sh"
else
  echo "  Everything is committed and pushed. Nothing to do."
fi