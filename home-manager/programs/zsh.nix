{ ... }: {
  programs = {
    zsh = {
      autocd = true;
      defaultKeymap = "viins";
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      history = {
        expireDuplicatesFirst = true;
        ignorePatterns = [ "rm *" "pkill *" ];
      };

      initExtra = builtins.readFile ./shell/git.functions;

      sessionVariables = {
        XDG_STATE_HOME        = "$HOME/.local/state";
        XDG_DATA_HOME         = "$HOME/.local/share";
        XDG_CACHE_HOME        = "$HOME/.cache";
        XDG_CONFIG_HOME       = "$HOME/.config";
        EDITOR                = "$(which nvim)";
        LOC_SRC               = "$HOME/Source";
        LOC_JEFF              = "$HOME/Source/github.com/jeffwindsor";
        LOC_NIXOS             = "$HOME/Source/github.com/jeffwindsor/nixos-config";
        GIT_LOG_PRETTY_FORMAT = "%C(green)%h%C(auto)%d%C(reset) - %s | %C(cyan)%an %C(dim)%cr%C(reset)";
        RIPGREP_CONFIG_PATH   = "$XDG_CONFIG_HOME/ripgrep/ripgreprc";
      };

      shellAliases = {
        # directories
        "...."     = "cd ../../../";
        "..."      = "cd ../../";
        ".."       = "cd ..";
        "dot"      = "cd $XDG_CONFIG_HOME";
        "config"   = "cd $XDG_CONFIG_HOME";
        "src"      = "cd $LOC_SRC";
        "srcs"     = "exec-on-git-repos cd \$LOC_SRC";
        "hub"      = "cd $LOC_SRC/github.com";
        "hubs"     = "exec-on-git-repos cd \$LOC_SRC/github.com";
        "jeff"     = "cd $LOC_JEFF";
        "in"       = "cd $LOC_NIXOS";
        "finb"     = "cd $LOC_JEFF/financials/gnucash/business/imports";
        "finh"     = "cd $LOC_JEFF/financials/gnucash/home/imports";
        "md"       = "cd $HOME/portable/exocortex/markdown";
        # nvim
        "v"        = "nvim";
        # bat / cat
        "cat"      = "bat --style=plain";
        # exa / ls
        "l"        = "eza -F --group-directories-first";
        "la"       = "eza -F --group-directories-first --git --all";
        "ll"       = "eza -lF --group-directories-first";
        "lla"      = "eza -lF --group-directories-first --git --all";
        "tree"     = "eza --tree --git";
        "treea"    = "eza -lF --tree --git --all";
        # grep / ripgrep
        "grep"     = "rg";
        "ar"       = "alias | rg";
        # freshfetch
        "f"        = "freshfetch";
        # git
        "lg"       = "lazygit";
        "gui"      = "lazygit";
        "ga"       = "git add";
        "gaa"      = "git add -u";
        "gb"       = "git branch -v";
        "gc"       = "git clone";
        "gcm"      = "git-commit";
        "gco"      = "git checkout";
        "gd"       = "git diff --ignore-space-at-eol -b -w --ignore-blank-lines";
        "gl"       = "git log";
        "gll"      = "git-log-graph";
        "gph"      = "git push";
        "gpl"      = "git pull";
        "gpls"     = "git-all pull";
        "gr"       = "git remote -vv";
        "gs"       = "git status -sb --ignore-submodules";
        "gup"      = "git-add-commit-push";
        # helix
        "h"        = "helix";
        # nixos
        "change"   = "nvim -c \":args $LOC_NIXOS/flake.nix $LOC_NIXOS/nixos/configuration.nix  $LOC_NIXOS/home-manager/home.nix\"";
        "changea"  = "nvim -c \":args $LOC_NIXOS/**/*.nix\"";
        "clean"    = "nix-env --delete-generations +7 && nix-collect-garbage";
        "list"     = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
        "optimize" = "nix store optimise";
        "rebuild"  = "sudo nixos-rebuild switch --flake $LOC_NIXOS/#frame";
        "shell"    = "nix-shell --command zsh";
        "up"       = "sudo nixos-rebuild switch --upgrade";
      };
    };
  };
}
