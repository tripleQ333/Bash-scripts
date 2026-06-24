#!/usr/bin/env bash
# index.sh — build a README.md at the repo root listing every write-up it finds
set -e

echo "Finding the repo:"
cd "$(git rev-parse --show-toplevel)"
repo_name="$(basename "$(pwd)")"

out="README.md"

echo "Scanning for write-ups (folders that contain a README.md):"
# Collect every README.md under the repo, except the root one we are writing.
mapfile -t readmes < <(find . -mindepth 2 -name "README.md" | sort)

echo "Writing $out with ${#readmes[@]} entr(ies):"
{
  echo "# $repo_name"
  echo
  echo "An auto-generated index of every write-up in this repo."
  echo
  echo "| Challenge | Path |"
  echo "| --- | --- |"
  for r in "${readmes[@]}"; do
    dir="$(dirname "$r")"            # ./category/name
    name="$(basename "$dir")"        # name
    clean="${dir#./}"               # strip leading ./
    # Link text is the challenge folder name; link points to its README.
    echo "| $name | [$clean]($clean/README.md) |"
  done
  echo
  echo "_Last generated: $(date '+%Y-%m-%d %H:%M')_"
} > "$out"

echo "Done. Wrote $out at the repo root."
echo "Review it, then commit with push.sh"