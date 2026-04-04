alias kd="kubectl --context dev"
alias ki="kubectl --context infra"

alias hms="home-manager switch --flake '/Users/ewoutm/dotfiles#ewoutm'"
alias reload-kitty='kill -SIGUSR1 $KITTY_PID'

alias google-java-format='git show --diff-filter=AM --name-only --pretty= HEAD | grep 'java$' | xargs -r ./tools/format/google-java-format-1.24.0 -i'
