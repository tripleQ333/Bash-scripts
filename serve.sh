#!/usr/bin/env bash
# instant static file server for the current folder
# usage: ./serve.sh 8000

port="${1:-8000}"
echo "serving $(pwd) at http://localhost:$port"
python3 -m http.server "$port"