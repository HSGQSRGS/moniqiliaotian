#!/usr/bin/env bash
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LOG="$ROOT/logs"; mkdir -p "$LOG"
echo "[$(date '+%F %T')] start $PORT" | tee -a "$LOG/serve.log"
cd "$ROOT" && (python3 -m http.server "${PORT:-8080}" >>"$LOG/serve.log" 2>&1 &)
sleep 1; bash "$ROOT/bin/monitor.sh"
