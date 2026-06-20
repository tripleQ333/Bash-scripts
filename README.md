# bash-toolkit

Ten small Bash scripts for everyday terminal automation. Each is standalone, no dependencies beyond common tools.

Make them executable once:
```
chmod +x *.sh
```

| script | what it does |
|---|---|
| `extract.sh` | extract any archive without remembering tar flags |
| `mkcd.sh` | make a directory and cd into it (source it) |
| `backup.sh` | timestamped tar.gz backup of a file or folder |
| `newscript.sh` | scaffold a new executable script with a safe header |
| `sysinfo.sh` | one-screen system snapshot (cpu, mem, disk, ip) |
| `findbig.sh` | list the 20 largest files under a directory |
| `killport.sh` | kill whatever process is holding a port |
| `gitsync.sh` | add, commit, and push the current branch in one go |
| `watch.sh` | rerun a command whenever files change |
| `serve.sh` | instant static file server for the current folder |

Most take an argument and print usage if you run them without one.