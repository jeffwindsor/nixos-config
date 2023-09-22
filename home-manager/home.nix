# TODO Split out Program configs into separate files?
{ config, pkgs, ... }:{

# home manager configuration
  home = {
    username = "mid";
    homeDirectory = "/home/mid";
    # manual = {
    #   html.enable = true;
    #   manpages.enable = true;
    # };
    packages = with pkgs; [
      brave         # backup browser
      exa           # ls replacement
      fd            # find replacement
      fortune       # saying that make my day
      freshfetch    # neofetch replacement
      gcc           # c compiler, required for nvim+treesitter
      megasync      # cloud storage
      # neovim        # editor (vim like)
      ripgrep       # grep replacement
      sd            # sed replacement
      xh            # curl replacement
      xplr          # tui file explorer
      # yadm          # dotfile management
    ];
    stateVersion = "23.05";
  };

# programs with declaritive dotfiles/configs
  programs = {
    alacritty       = import ./programs/alacritty.nix;
    bat             = { enable = true; config.theme = "Nord"; };
    chromium.enable = true;
    # dconf           = import ./programs/dconf.nix;
    firefox.enable  = true;
    fzf             = { enable = true; enableZshIntegration = true; };
    git             = import ./programs/git.nix;
    helix           = import ./programs/helix.nix;
    lazygit.enable  = true;
    neovim          = import ./programs/neovim.nix { config=config; pkgs=pkgs; };
    nushell.enable  = true;
    starship        = import ./programs/starship.nix;
    tealdeer        = import ./programs/tealdeer.nix;
    zellij.enable   = true;
    zsh             = import ./programs/zsh.nix;
  };

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
    "hub"      = "cd $LOC_SRC/github.com";
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
    "change"   = "nvim -c \":args $LOC_NIXOS/nixos/configuration.nix  $LOC_NIXOS/home-manager/home.nix\"";
    "changea"  = "nvim -c \":args $LOC_NIXOS/**/*.nix\"";
    "clean"    = "nix-env --delete-generations +7 && nix-collect-garbage";
    "list"     = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
    "optimize" = "nix store optimise";
    "rebuild"  = "sudo rm -rf /etc/nixos && sudo cp -fr \$LOC_NIXOS/nixos /etc && sudo cp -fr \$LOC_NIXOS/home-manager /etc/nixos && sudo nixos-rebuild switch";
    "shell"    = "nix-shell --command zsh";
    "up"       = "sudo nixos-rebuild switch --upgrade";
  };

}
