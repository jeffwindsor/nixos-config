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

    neovim          = {
      enable = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [
        auto-save-nvim                # https://github.com/pocco81/auto-save.nvim/
        gitsigns-nvim                 # https://github.com/lewis6991/gitsigns.nvim/ 
        {
          plugin =  indent-blankline-nvim;         
          #config = "char = '┊'\nshow_trailing_blankline_indent = false";
        }
        mini-nvim                     # https://github.com/echasnovski/mini.nvim/
        nvim-cmp                      # https://github.com/hrsh7th/nvim-cmp/
        nvim-lspconfig                # https://github.com/neovim/nvim-lspconfig/
        nvim-treesitter               # https://github.com/nvim-treesitter/nvim-treesitter/
        telescope-nvim                # https://github.com/nvim-telescope/telescope.nvim/
        vim-sleuth                    # https://github.com/tpope/vim-sleuth/
        which-key-nvim                # https://github.com/folke/which-key.nvim/

        # themes
        catppuccin-nvim
        gruvbox-nvim
        iceberg-vim
        kanagawa-nvim
        material-nvim
        nord-nvim
        onedark-vim
        papercolor-theme
        tender-vim
        tokyonight-nvim
      ];

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraLuaConfig = builtins.readFile(./programs/neovim/config.lua);
    };
  };
}
