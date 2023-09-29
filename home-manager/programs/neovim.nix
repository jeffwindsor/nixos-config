{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs;  [
        wl-clipboard
        xclip
    ];
    plugins = with pkgs.vimPlugins; [
      auto-save-nvim
      gitsigns-nvim
      {
        plugin = indent-blankline-nvim;
        type   = "lua";
        config = builtins.readFile(./neovim/plugins/indent-blankline-nvim.lua);
      }
      {
        plugin = mini-nvim;
        type   = "lua";
        config = builtins.readFile(./neovim/plugins/mini-nvim.lua);
      }
      {
        plugin = nvim-cmp;
        type   = "lua";
        config = builtins.readFile(./neovim/plugins/nvim-cmp.lua);
      }
      cmp-nvim-lsp
      luasnip
      cmp_luasnip
      nvim-treesitter
      nvim-treesitter-textobjects
      {
        plugin = telescope-nvim;
        type   = "lua";
        config = builtins.readFile(./neovim/plugins/telescope-nvim.lua);
      }
      {
        plugin = telescope-file-browser-nvim;
        type   = "lua";
        config = builtins.readFile(./neovim/plugins/telescope-file-browser-nvim.lua);
      }
      plenary-nvim
      vim-sleuth
      {
        plugin = which-key-nvim;
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
}
