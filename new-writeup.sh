#!/usr/bin/env bash
# new-writeup.sh — scaffold a new challenge write-up folder
set -e

if [ $# -lt 2 ]; then
  echo "Usage: $0 <category-path> <challenge-name> [title]"
  echo "Example: $0 \"picoCTF/Medium\" \"heap4\""
  exit 1
fi

category="$1"
name="$2"
title="${3:-$name}"

# Where the Info.svg template lives. Change this if the CTF repo moves.
template_root="$HOME/QQQ's_Github/Binary-Exploitation-CTFs"

echo "Finding the repo:"
cd "$(git rev-parse --show-toplevel)"

target="$category/$name"
echo "New write-up will live at: $target"

if [ -e "$target" ]; then
  echo "That folder already exists. Stopping so nothing is overwritten."
  exit 1
fi

echo "Creating folders (Images and Scripts):"
mkdir -p "$target/Images" "$target/Scripts"

echo "Copying Info.svg template:"
info_src="$(find "$template_root" -type f -iname 'Info.svg' -print -quit 2>/dev/null)"
if [ -n "$info_src" ]; then
  cp "$info_src" "$target/Scripts/Info.svg"
  echo "  Copied from: $info_src"
else
  echo "  No Info.svg found under $template_root. Skipping."
fi

echo "Writing README skeleton:"
cat > "$target/README.md" <<EOF
![alt text](../../../Ignore-it/red-blood.svg)
![alt text](Scripts/Info.svg)
## Challenge Overview
![alt text](Images/1.challenge's_statement.png)
> challenge description goes here
$title write-up starts here.
## What This Challenge Teaches
- 
EOF

echo "Keeping empty folders tracked by git:"
touch "$target/Images/.gitkeep" "$target/Scripts/.gitkeep"

echo "Done. Created $target"