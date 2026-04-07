#!/bin/bash
# CPU usage percentage for macOS status bar
# Uses ps instead of top — top -l 1 blocks for ~2s per call
ps -A -o %cpu | tail -n +2 | awk -v c="$(sysctl -n hw.logicalcpu)" '{s+=$1} END {printf "%.0f", s/c}'
