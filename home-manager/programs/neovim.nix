{ config, pkgs, ... }: {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  # merge lua neovim config modules
  extraLuaConfig = ''
    ${builtins.readFile(./neovim/config/autocommands.lua)}
    ${builtins.readFile(./neovim/config/keybindings.lua)}
    ${builtins.readFile(./neovim/config/options.lua)}
  '';

  extraPackages = with pkgs;  [
      wl-clipboard
      xclip
  ];

  plugins = with pkgs.vimPlugins; [
    auto-save-nvim
    cmp-nvim-lsp                    # dependency: cmp
    cmp_luasnip                     # dependency: cmp
    gitsigns-nvim
    luasnip                         # dependency: cmp
    neorg                           # testing this
    nvim-colorizer-lua
    nvim-treesitter                 # dependency: tree-sitter
    nvim-treesitter-textobjects     # dependency: tree-sitter
    plenary-nvim                    # dependency: telescope
    vim-sleuth                      # auto adjust shift and tab width

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
      plugin = nvim-base16;
      type = "lua";
      config = builtins.readFile(./neovim/plugins/nvim-base16.lua);
    }
    {
      plugin = nvim-cmp;
      type   = "lua";
      config = builtins.readFile(./neovim/plugins/nvim-cmp.lua);
    }
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
    {
      plugin = which-key-nvim;
      type   = "lua";
      config = builtins.readFile(./neovim/plugins/which-key-nvim.lua);
    }
  ];

}
