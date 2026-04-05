{ lib, pkgs, dotfiles, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
    ];

  home.username = "ewoutm";
  home.homeDirectory = "/Users/ewoutm";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    # terminal & shell
    kitty
    zsh
    zellij
    tmux

    # CLI tools
    curl
    fd
    fzf
    fzy
    gnupg
    jq
    nmap
    rename
    ripgrep
    socat
    inetutils
    tree
    watch
    wget
    xclip
    yq

    # editors & IDE
    vscode

    # dev tools
    ansible
    bazel
    docker-buildx
    gcc
    git-lfs
    gnumake
    go
    kubernetes-helm
    maven
    nodejs
    (lib.meta.lowPrio openjdk11)
    openjdk17
    yarn

    # languages
    (pkgs.python313.withPackages (p: with p; [
      virtualenv
      requests
    ]))
    p4
  ];

  home.file = {
    ".config/kitty".source  = "${dotfiles}/kitty";
    ".config/nvim".source   = "${dotfiles}/nvim";
    ".config/zellij".source = "${dotfiles}/zellij";
    ".config/zsh".source    = "${dotfiles}/zsh";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    signing.format = "openpgp";
    settings = {
      alias = {
        co = "checkout";
        br = "branch";
        ci = "commit";
        st = "status";
        unstage = "reset HEAD --";
        last = "log -1 HEAD";
        aliases = "config --get-regexp ^alias";
      };
      core.editor = "nvim";
      push.default = "nothing";
      filter.lfs = {
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
        clean = "git-lfs clean -- %f";
      };
      lfs.allow = 1;
    };
    includes = [
      { path = "~/.config/git/config.local"; }
    ];
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    profileExtra = ''
      if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      fi

      if [ -e "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
        source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      fi
    '';

    plugins = with pkgs; [
      {
        name = "powerlevel10k";
        src = fetchFromGitHub {
          owner = "romkatv";
          repo = "powerlevel10k";
          rev = "b7d90c84671183797bdec17035fc2d36b5d12292";
          sha256 = "0nzvshv3g559mqrlf4906c9iw4jw8j83dxjax275b2wi8ix0wgmj";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.6.0";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
        file = "zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-autopair";
        src = fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopair";
          rev = "34a8bca0c18fcf3ab1561caef9790abffc1d3d49";
          sha256 = "1h0vm2dgrmb8i2pvsgis3lshc5b0ad846836m62y8h3rdb3zmpy1";
        };
        file = "autopair.zsh";
      }
    ];
    prezto = {
      enable = true;
      caseSensitive = false;
      prompt = {
        theme = "powerlevel10k";
      };
    };
    initContent = ''
      POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
      source ${dotfiles}/zsh/theme/p10k.zsh
      source ${dotfiles}/zsh/aliases.zsh
      source ${dotfiles}/zsh/paths.zsh
      source ${dotfiles}/zsh/env_vars.zsh
      [[ -f ${dotfiles}/zsh/env_vars.local.zsh ]] && source ${dotfiles}/zsh/env_vars.local.zsh
    '';
  };
}
