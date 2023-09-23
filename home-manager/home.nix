# TODO Split out Program configs into separate files?
{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    ./programs/alacritty.nix
    ./programs/git.nix
    ./programs/helix.nix
    ./programs/neovim.nix
    ./programs/starship.nix
    ./programs/tealdeer.nix
    ./programs/zsh.nix
  ];

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
      ripgrep       # grep replacement
      sd            # sed replacement
      xh            # curl replacement
      xplr          # tui file explorer
    ];
    stateVersion = "23.05";
  };

  # programs with declaritive dotfiles/configs
  programs = {
    bat             = { enable = true; config.theme = "Nord"; };
    chromium.enable = true;
    # dconf           = import ./programs/dconf.nix;
    firefox.enable  = true;
    fzf             = { enable = true; enableZshIntegration = true; };
    lazygit.enable  = true;
    nushell.enable  = true;
    zellij.enable   = true;
  };
}
