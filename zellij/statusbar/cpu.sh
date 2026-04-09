#!/bin/bash
# CPU usage percentage for macOS status bar
# Cached to share across zjstatus tab instances
cache="/tmp/zjstatus_cpu"
max_age=8

if [ -f "$cache" ] && [ $(( $(date +%s) - $(stat -f %m "$cache") )) -lt $max_age ]; then
  cat "$cache"
else
  result=$(ps -A -o %cpu | tail -n +2 | awk -v c="$(sysctl -n hw.logicalcpu)" '{s+=$1} END {printf "%.0f", s/c}')
  printf '%s' "$result" | tee "$cache"
fi
