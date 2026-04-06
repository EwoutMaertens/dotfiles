#!/bin/bash
# Zellij post_command_discovery_hook
# Receives command via $RESURRECT_COMMAND env var.
# Whatever is sent to STDOUT replaces the serialized command.

cmd="$RESURRECT_COMMAND"
wrapper="bash $HOME/dotfiles/zellij/run-and-shell.sh"

# Replace Nix store nvim paths with plain nvim, strip the wrapper init lua
if echo "$cmd" | grep -q "nvim"; then
  files=$(echo "$cmd" | grep -oE '[^ ]+\.(nix|lua|py|go|js|ts|json|yaml|yml|toml|kdl|zsh|sh|md|conf|vim)' | grep -v '/nix/store/' | tr '\n' ' ')
  if [ -n "$files" ]; then
    echo "$wrapper nvim $files"
  else
    echo "zsh"
  fi
  exit 0
fi

# Don't replay home-manager switch or nix commands
if echo "$cmd" | grep -qE "home-manager|nix flake|hms"; then
  echo "zsh"
  exit 0
fi

# Keep claude sessions — wrap so exiting returns to shell
if echo "$cmd" | grep -q "claude"; then
  echo "$wrapper $cmd"
  exit 0
fi

# Replace any nix store binary paths with their basename
cmd=$(echo "$cmd" | sed -E 's|/nix/store/[a-z0-9]+-[^/]+/bin/||g')

echo "$cmd"
