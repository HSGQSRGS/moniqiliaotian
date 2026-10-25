#!/usr/bin/env bash
APP="union"
BRAND="联盟"
AUTHOR="Lion"
ROOT="$(cd "$(dirname "$0")" && pwd)"
WEB="${WEB:-/www/wwwroot/$APP}"
PORT="${PORT:-8080}"
BACKUP="$ROOT/backup"
LOG="$ROOT/logs"
mkdir -p "$BACKUP" "$LOG"
ts(){ date '+%Y-%m-%d %H:%M:%S'; }
log(){ echo "[$(ts)] $*" | tee -a "$LOG/deploy.log"; }

case "$1" in
  build)  log "构建校验"; bash "$ROOT/bin/check.sh" ;;
  start)  bash "$ROOT/bin/start.sh" ;;
  stop)   bash "$ROOT/bin/stop.sh" ;;
  reload) bash "$ROOT/bin/reload.sh" ;;
  restart)bash "$ROOT/bin/stop.sh"; bash "$ROOT/bin/start.sh" ;;
  monitor)bash "$ROOT/bin/monitor.sh" ;;
  backup) bash "$ROOT/bin/backup.sh" "$@" ;;
  rollback) bash "$ROOT/bin/rollback.sh" "$@" ;;
  log)    tail -n "${2:-100}" "$LOG/deploy.log" ;;
  *)      echo "用法: bash setup.sh {build|start|stop|reload|restart|monitor|backup|rollback|log}" ;;
esac
