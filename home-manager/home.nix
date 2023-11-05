{ inputs, pkgs, config, build, ... }: {

  imports = [
    ./dconf.nix
  ];

  # programs with managed configuration
  programs = {
    alacritty       = import ./alacritty.nix { config = config; };
    bash            = import ./bash.nix;
    bat             = import ./bat.nix { pkgs = pkgs; };
    fzf             = import ./fzf.nix;
    git             = import ./git.nix;
    helix           = import ./helix.nix;
    lf              = import ./lf.nix;
    # neovim          = import ./neovim.nix { config = config; pkgs = pkgs; };
    starship        = import ./starship.nix;
    tealdeer        = import ./tealdeer.nix;
    zellij          = import ./zellij.nix { config = config; };
    zsh             = import ./zsh.nix;
    chromium.enable = true;
    firefox.enable  = true;
    lazygit.enable  = true;
    nushell.enable  = true;
    # pywal.enable    = true;
  };

  home = {
    homeDirectory = "/home/${build.user}";
    packages = with pkgs; [
      brave             # backup browser
      libreoffice       # office
      megasync          # cloud storage
      obsidian          # notes
      popsicle          # usb flasher
      spotify           # music player
      # thunderbird       # mail
      transmission-gtk  # bit torrent
      vlc               # video player

      eza               # ls replacement
      fd                # find replacement
      fortune           # saying that make my day
      freshfetch        # neofetch replacement
      gcc               # c compiler, required for nvim+treesitter
      hledger
      hledger-ui
      hledger-web
      jq                # json tool
      ripgrep           # grep replacement
      sd                # sed replacement
      wl-clipboard      # wayland cli clipboard enabler
      xh                # curl replacement
      xplr              # tui file explorer
    ];

    sessionVariables = {
      GIT_LOG_PRETTY_FORMAT = "%C(green)%h%C(reset) - %s%C(cyan) | %an%C(dim) | %ch %C(auto)%d%C(reset)";
      LOC_JEFF              = "$HOME/Source/github.com/jeffwindsor";
      LOC_NIXOS             = "$HOME/Source/github.com/jeffwindsor/nixos-config";
      LOC_SRC               = "$HOME/Source";
      OPENER                = "xgd-open";
      XDG_CACHE_HOME        = "$HOME/.cache";
      XDG_CONFIG_HOME       = "$HOME/.config";
      XDG_DATA_HOME         = "$HOME/.local/share";
      XDG_STATE_HOME        = "$HOME/.local/state";
    };

    shellAliases = {
      # directories
      "...."     = "cd ../../../";
      "..."      = "cd ../../";
      ".."       = "cd ..";
      "dot"      = "cd $LOC_NIXOS";
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

      # bat / cat
      "cat"      = "bat --style=plain";

      # exa / ls
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
      "g"        = "lazygit";
      "ga"       = "git add";
      "gaa"      = "git add --all";
      # "gau"      = "git add -u";
      # "gb"       = "git branch -v";
      # "gc"       = "git clone";
      "gcm"      = "git-commit";
      # "gco"      = "git checkout";
      "gd"       = "git diff --ignore-space-at-eol -b -w --ignore-blank-lines -U0";
      "gl"       = "git log";
      "gll"      = "git-log-graph";
      "gph"      = "git push";
      "gpl"      = "git pull";
      # "gpls"     = "git-all pull";
      "gr"       = "git remote -vv";
      "gs"       = "git status -sb --ignore-submodules";
      "gup"      = "git-add-commit-push";

      # helix
      "h"        = "hx";

      # hledger
      "hi"       = "hledger import";
      "hid"      = "hledger import ./--dry-run";
      "hp"       = "export LEDGER_FILE=$LOC_JEFF/financials-home/ledger && cd $LOC_JEFF/financials-home/";
      "hb"       = "export LEDGER_FILE=$LOC_JEFF/financials-wfp/ledger && cd $LOC_JEFF/financials-wfp/";
      "hunknown" = "hledger -f- -I print unknown";  # filter to "unknown" ledger account

      # nixos
      "system"   = "cd $LOC_NIXOS && hx ./home-manager/home.nix ./nixos/configuration.nix ./nixos/gnome.nix flake.nix";
      "nixos"    = "cd $LOC_NIXOS && hx $(fd --type f | fzf --layout reverse --preview 'bat -n --color=always {}')";

      "clean"    = "nix-env --delete-generations +9 --profile /nix/var/nix/profiles/system && nix-collect-garbage && nix store optimise && flatpak uninstall --unused -y";
      "list"     = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      "rebuild"  = "sudo nixos-rebuild switch --flake $LOC_NIXOS/#frame";
      "upgrade"  = "sudo nixos-rebuild switch --flake $LOC_NIXOS/#frame --upgrade";
      "shell"    = "nix-shell --command zsh";
      "dev"      = "nix develop --command zsh";

      # zellij
      "z"        = "zellij";
      "zs"       = "zellij --session";
      "zl"       = "zellij --layout";
    };

    stateVersion = "${build.stateVersion}";
    username     = "${build.user}";
  };


}



