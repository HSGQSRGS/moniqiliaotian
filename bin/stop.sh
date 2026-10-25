#!/usr/bin/env bash
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
P="${PORT:-8080}"
for pid in $(ps -eo pid,args | grep "http.server $P" | grep -v grep | awk '{print $1}'); do kill -9 "$pid" 2>/dev/null; done
echo "stopped $P"
