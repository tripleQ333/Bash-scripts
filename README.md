# Bash-scripts

A personal collection of small Bash utilities I use day to day on Kali: repo
management, system info, file wrangling, and CTF write-up scaffolding. Each
script does one thing and is meant to be dropped straight into a workflow.

## Scripts

### Git and repositories

| Script | What it does |
| --- | --- |
| `push.sh` | Stage, commit, and push in one step. Defaults the commit message to "Uploaded" when none is given. |
| `gitsync.sh` | Pull the latest from the remote, then push local changes, keeping a repo in sync. |
| `status.sh` | Quick status summary for a repo (or across repos). |
| `index.sh` | Auto-generate an index of write-ups in the repo and write it to a README. |

### CTF write-ups

| Script | What it does |
| --- | --- |
| `new-writeup.sh` | Scaffold a new challenge write-up folder (creates `Images/` and `Scripts/`, a README skeleton, and copies the `Info.svg` template). |

### System

| Script | What it does |
| --- | --- |
| `sysinfo.sh` | Print a summary of system information. |
| `killport.sh` | Kill whatever process is listening on a given port. |
| `serve.sh` | Serve the current directory over HTTP. |
| `watch.sh` | Re-run a command whenever files change. |

### Files and shell

| Script | What it does |
| --- | --- |
| `backup.sh` | Create a timestamped backup of a file or directory. |
| `extract.sh` | Universal archive extractor (tar, zip, gz, and friends). |
| `findbig.sh` | Find the largest files under a directory. |
| `mkcd.sh` | Make a directory and `cd` into it. |
| `newscript.sh` | Scaffold a new Bash script from a starter template. |

## Usage

Clone the repo and run any script directly:

```bash
git clone https://github.com/tripleQ333/Bash-scripts.git
cd Bash-scripts
bash new-writeup.sh pico/med heap4
```

### Run from anywhere (optional)

Make the scripts executable and add the repo to your `PATH` so you can call
them by name from any directory:

```bash
# from inside the cloned repo
chmod +x *.sh
echo "export PATH=\"$(pwd):\$PATH\"" >> ~/.zshrc
source ~/.zshrc
```

After that, `new-writeup.sh pico/med heap4` works from anywhere.

## Requirements

- Bash
- `git` for the repo scripts
- Standard GNU coreutils (`find`, `cp`, `mkdir`, etc.)

## Notes

- These scripts are tailored to my own setup, so paths and defaults may need
  adjusting for yours.
- `index.sh` regenerates a README automatically, so don't keep hand-written
  notes in whichever file it targets or they will be overwritten.

## License

MIT. Use, modify, and share freely.