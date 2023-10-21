{ inputs, outputs, pkgs, config, build, ... }: {

  # Nix Colors | https://github.com/tinted-theming/base16-schemes | https://tinted-theming.github.io/base16-gallery/
  colorScheme = with inputs.nix-colors.colorSchemes;
    decaf;    # decaf; woodland; nova;
    # Others | atlas; materia; equilibrium-dark; gruvbox-dark-hard; gruvbox-light-hard; hardcore; danqing; tender; tomorrow; ayu-mirage;

  imports = [ 
    inputs.nix-colors.homeManagerModules.default 
    ./programs/dconf.nix
  ];
  
  # programs with managed configuration
  programs = {
    alacritty       = import ./programs/alacritty.nix { config = config; };
    bash            = import ./programs/bash.nix;
    bat             = import ./programs/bat.nix { pkgs = pkgs; };
    fzf             = import ./programs/fzf.nix;
    git             = import ./programs/git.nix;
    helix           = import ./programs/helix.nix;
    lf              = import ./programs/lf.nix;
    neovim          = import ./programs/neovim.nix { config = config; pkgs = pkgs; };
    starship        = import ./programs/starship.nix;
    tealdeer        = import ./programs/tealdeer.nix;
    zellij          = import ./programs/zellij.nix { config = config; };
    zsh             = import ./programs/zsh.nix;
    chromium.enable = true;
    firefox.enable  = true;
    lazygit.enable  = true;
    nushell.enable  = true;
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
      thunderbird       # mail
      transmission-gtk  # bit torrent
      vlc               # video player

      exa               # ls replacement
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
      "gaa"      = "git add --all";
      "gau"      = "git add -u";
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
      # hledger
      "hi"       = "hledger import";
      "hid"      = "hledger import --dry-run";
      "hp"       = "export LEDGER_FILE=$LOC_JEFF/financials-home/ledger && cd $LOC_JEFF/financials-home/";
      "hb"       = "export LEDGER_FILE=$LOC_JEFF/financials-wfp/ledger && cd $LOC_JEFF/financials-wfp/";
      "hunknown" = "hledger -f- -I print unknown";  # filter to "unknown" ledger account
 
      # nvim
      "v"        = "nvim";
      # nixos
      "system"   = "cd $LOC_NIXOS && nvim -c \":args ./home-manager/home.nix ./nixos/configuration.nix ./nixos/gnome.nix flake.nix\"";
      "home"     = "cd $LOC_NIXOS/home-manager && nvim -c \":args ./**/*.nix\"";
      "neovim"   = "cd $LOC_NIXOS/home-manager/programs && nvim -c \":args neovim.nix ./neovim/**/*\"";
      "helix"    = "cd $LOC_NIXOS/home-manager/programs && nvim -c \":args helix.nix ./helix/**/*\"";
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



