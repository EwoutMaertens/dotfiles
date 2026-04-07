#!/bin/bash
# Memory usage for macOS status bar
# Outputs used memory in GB (e.g. "12.3Gb")
page_size=$(sysctl -n hw.pagesize)
pages_active=$(vm_stat | awk '/Pages active/ {gsub(/\./,"",$3); print $3}')
pages_wired=$(vm_stat | awk '/Pages wired/ {gsub(/\./,"",$4); print $4}')
pages_compressed=$(vm_stat | awk '/Pages occupied by compressor/ {gsub(/\./,"",$5); print $5}')
used=$(( (pages_active + pages_wired + pages_compressed) * page_size / 1073741824 ))
remainder=$(( ((pages_active + pages_wired + pages_compressed) * page_size % 1073741824) * 10 / 1073741824 ))
echo "${used}.${remainder}Gb"
