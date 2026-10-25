#!/usr/bin/env bash
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
P="${PORT:-8080}"
exec python3 "$ROOT/bin/monitor.py" "$P"
