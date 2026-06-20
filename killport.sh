#!/usr/bin/env bash
# free up a port by killing whatever process is holding it
# usage: ./killport.sh 8080

set -euo pipefail
port="${1:?usage: killport.sh <port>}"
pid="$(lsof -ti tcp:"$port" 2>/dev/null || true)"

[ -z "$pid" ] && { echo "nothing on port $port"; exit 0; }
kill -9 $pid && echo "killed pid(s) $pid on port $port"