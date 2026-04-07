#!/bin/bash
# Weather for status bar — cached for 30 minutes to avoid API spam
cache="/tmp/zjstatus_weather"
max_age=1800

trim() { sed 's/  */ /g;s/^ *//;s/ *$//'; }

if [ -f "$cache" ] && [ $(( $(date +%s) - $(stat -f %m "$cache") )) -lt $max_age ]; then
  cat "$cache" | trim
else
  result=$(curl -s --max-time 5 "wttr.in/?format=%c%t" 2>/dev/null | tr -d '+' | trim)
  if [ -n "$result" ] && ! echo "$result" | grep -qiE "Unknown|error|render failed|Sorry"; then
    echo "$result" > "$cache"
    echo "$result"
  elif [ -f "$cache" ]; then
    cat "$cache" | trim
  fi
fi
