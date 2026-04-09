#!/bin/bash
# Currently playing Spotify track for status bar
# Cached to share across zjstatus tab instances
cache="/tmp/zjstatus_song"
max_age=8

if [ -f "$cache" ] && [ $(( $(date +%s) - $(stat -f %m "$cache") )) -lt $max_age ]; then
  cat "$cache"
else
  result=$(osascript -e '
tell application "System Events"
  if not (exists (processes where name is "Spotify")) then return ""
end tell
tell application "Spotify"
  if player state is not playing then return ""
  return (artist of current track) & " - " & (name of current track)
end tell
' 2>/dev/null)
  printf '%s' "$result" > "$cache"
  printf '%s' "$result"
fi
