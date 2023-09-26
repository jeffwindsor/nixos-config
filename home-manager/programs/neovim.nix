# look at
#   https://github.com/NixNeovim/NixNeovimPlugins
#   https://gist.github.com/nat-418/d76586da7a5d113ab90578ed56069509
{ pkgs, ... }: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs;  [
          wl-clipboard                # manages terminal to clipboard copies (wayland)
          xclip                       # manages terminal to clipboard copies (xorg)

          # maybe some lsps???
      ];
      plugins = with pkgs.vimPlugins; [
        auto-save-nvim                # https://github.com/pocco81/auto-save.nvim/
        gitsigns-nvim                 # https://github.com/lewis6991/gitsigns.nvim/
        {
          plugin = indent-blankline-nvim;
          type   = "lua";
          config = builtins.readFile(./neovim/plugins/indent-blankline-nvim.lua);
        }
        {
          plugin = mini-nvim;         # https://github.com/echasnovski/mini.nvim/
          type   = "lua";
          config = builtins.readFile(./neovim/plugins/mini-nvim.lua);
        }
        # {
        #   plugin = nvim-cmp;          # https://github.com/hrsh7th/nvim-cmp/
        #   type   = "lua";
        #   config = builtins.readFile(./neovim/plugins/nvim-cmp.lua);
        # }
        # {
        #   plugin = nvim-lspconfig;    # https://github.com/neovim/nvim-lspconfig/
        #   type   = "lua";
        #   config = builtins.readFile(./neovim/plugins/nvim-lspconfig.lua);
        # }
        # nvim-treesitter               # https://github.com/nvim-treesitter/nvim-treesitter/
        {
          plugin = telescope-nvim;    # https://github.com/nvim-telescope/telescope.nvim/
          type   = "lua";
          config = builtins.readFile(./neovim/plugins/telescope-nvim.lua);
        }
        plenary-nvim
        vim-sleuth                    # https://github.com/tpope/vim-sleuth/
        {
          plugin = which-key-nvim;    # https://github.com/folke/which-key.nvim/
          type   = "lua";
          config = builtins.readFile(./neovim/plugins/which-key-nvim.lua);
        }

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
      extraLuaConfig = builtins.readFile(./neovim/config.lua);
    };
  };
}
