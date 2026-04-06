#!/bin/bash
# Runs the given command with args, then drops into interactive zsh.
# Used by zellij resurrection so panes return to a shell on exit.
"$@"
exec zsh -i
