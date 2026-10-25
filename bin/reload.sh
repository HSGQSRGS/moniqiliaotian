#!/usr/bin/env bash
bash "$(dirname "$0")/stop.sh"; sleep 1; bash "$(dirname "$0")/start.sh"
