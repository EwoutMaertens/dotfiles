#!/bin/bash
# Memory usage for macOS status bar
# Cached to share across zjstatus tab instances
cache="/tmp/zjstatus_memo"
max_age=8

if [ -f "$cache" ] && [ $(( $(date +%s) - $(stat -f %m "$cache") )) -lt $max_age ]; then
  cat "$cache"
else
  page_size=$(sysctl -n hw.pagesize)
  pages_active=$(vm_stat | awk '/Pages active/ {gsub(/\./,"",$3); print $3}')
  pages_wired=$(vm_stat | awk '/Pages wired/ {gsub(/\./,"",$4); print $4}')
  pages_compressed=$(vm_stat | awk '/Pages occupied by compressor/ {gsub(/\./,"",$5); print $5}')
  used=$(( (pages_active + pages_wired + pages_compressed) * page_size / 1073741824 ))
  remainder=$(( ((pages_active + pages_wired + pages_compressed) * page_size % 1073741824) * 10 / 1073741824 ))
  result="${used}.${remainder}Gb"
  printf '%s' "$result" | tee "$cache"
fi
