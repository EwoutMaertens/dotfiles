alias kd="kubectl --context dev"
alias ki="kubectl --context infra"

alias hms="nix flake update --flake '$HOME/dotfiles' && home-manager switch --flake '$HOME/dotfiles#ewoutm'"
alias reload-kitty='kill -SIGUSR1 $KITTY_PID'
alias claude='lclaude'

alias google-java-format='git show --diff-filter=AM --name-only --pretty= HEAD | grep 'java$' | xargs -r ./tools/format/google-java-format-1.24.0 -i'
