# TODO Split out Program configs into separate files?
{ config, pkgs, ... }:{

# home manager configuration
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
    firefox.enable  = true;
    fzf             = { enable = true; enableZshIntegration = true; };
    git             = import ./programs/git.nix;
    helix           = import ./programs/helix.nix;
    lazygit.enable  = true;
    nushell.enable  = true;
    starship        = import ./programs/starship.nix;
    tealdeer        = import ./programs/tealdeer.nix;
    zellij.enable   = true;
    zsh             = import ./programs/zsh.nix;

    neovim          = import ./programs/neovim.nix { config=config; pkgs=pkgs; };
  };
}
