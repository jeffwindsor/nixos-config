# TODO : Pass in the user name mid?

{ inputs, outputs, pkgs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mid = {
      imports = [
        ./programs/alacritty.nix
        ./programs/bash.nix
        ./programs/git.nix
        ./programs/helix.nix
        ./programs/lf.nix
        ./programs/neovim.nix
        ./programs/starship.nix
        ./programs/tealdeer.nix
        ./programs/zsh.nix
      ];

      programs = {
        bat             = { enable = true; config.theme = "Nord"; };
        chromium.enable = true;
        # dconf           = import ./programs/dconf.nix;
        firefox.enable  = true;
        fzf             = { enable = true; enableBashIntegration = true; enableZshIntegration = true; };
        lazygit.enable  = true;
        nushell.enable  = true;
        zellij.enable   = true;
      };

      home = {
        username = "mid";
        homeDirectory = "/home/mid";
        packages = with pkgs; [
          brave         # backup browser
          exa           # ls replacement
          fd            # find replacement
          fortune       # saying that make my day
          freshfetch    # neofetch replacement
          gcc           # c compiler, required for nvim+treesitter
          megasync      # cloud storage
          ripgrep       # grep replacement
          sd            # sed replacement
          xh            # curl replacement
          xplr          # tui file explorer
        ];

        sessionVariables = {
          XDG_STATE_HOME        = "$HOME/.local/state";
          XDG_DATA_HOME         = "$HOME/.local/share";
          XDG_CACHE_HOME        = "$HOME/.cache";
          XDG_CONFIG_HOME       = "$HOME/.config";
          LOC_SRC               = "$HOME/Source";
          LOC_JEFF              = "$HOME/Source/github.com/jeffwindsor";
          LOC_NIXOS             = "$HOME/Source/github.com/jeffwindsor/nixos-config";
          GIT_LOG_PRETTY_FORMAT = "%C(green)%h%C(auto)%d%C(reset) - %s | %C(cyan)%an %C(dim)%cr%C(reset)";
          NIX_SYSTEM_PROFILE    = "--profile /nix/var/nix/profiles/system";
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
          "l"        = "exa -F --group-directories-first";
          "la"       = "exa -F --group-directories-first --git --all";
          "ll"       = "exa -lF --group-directories-first";
          "lla"      = "exa -lF --group-directories-first --git --all";
          "tree"     = "exa --tree --git";
          "treea"    = "exa -lF --tree --git --all";
          # grep / ripgrep
          "grep"     = "rg";
          "ar"       = "alias | rg";
          # freshfetch
          "f"        = "freshfetch";
          # git
          "lg"       = "lazygit";
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
          "change"   = "cd $LOC_NIXOS && nvim -c \":args flake.nix ./nixos/configuration.nix  ./home-manager/home.nix\"";
          "changea"  = "cd $LOC_NIXOS && nvim -c \":args ./**/*.nix\"";
          "home"     = "cd $LOC_NIXOS/home-manager && nvim -c \":args ./**/*.nix\"";
          "clean"    = "nix-env --delete-generations +7 && nix-collect-garbage && nix store optimise";
          "list"     = "sudo nix-env --list-generations $NIX_SYSTEM_PROFILE";
          "rebuild"  = "sudo nixos-rebuild switch --flake $LOC_NIXOS/#frame";
          "rebuildu" = "sudo nixos-rebuild switch --upgrade --flake $LOC_NIXOS/#frame";
          "shell"    = "nix-shell --command zsh";
        };

        stateVersion = "23.05";
      };

    };
  };
}



