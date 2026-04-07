#!/bin/bash
# Currently playing Spotify track for status bar (single osascript call)
osascript -e '
tell application "System Events"
  if not (exists (processes where name is "Spotify")) then return ""
end tell
tell application "Spotify"
  if player state is not playing then return ""
  return (artist of current track) & " - " & (name of current track)
end tell
' 2>/dev/null
