{ config, pkgs, ... }: {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

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
    gitsigns-nvim
    nvim-colorizer-lua
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
    {
      plugin = nvim-base16;
      type = "lua";

      # base00 - Default Background
      # base01 - Lighter Background (Used for status bars, line number and folding marks)
      # base02 - Selection Background
      # base03 - Comments, Invisibles, Line Highlighting
      # base04 - Dark Foreground (Used for status bars)
      # base05 - Default Foreground, Caret, Delimiters, Operators
      # base06 - Light Foreground (Not often used)
      # base07 - Light Background (Not often used)
      # base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
      # base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
      # base0A - Classes, Markup Bold, Search Text Background
      # base0B - Strings, Inherited Class, Markup Code, Diff Inserted
      # base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
      # base0D - Functions, Methods, Attribute IDs, Headings
      # base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
      # base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

      config = with config.colorScheme.colors; ''
        require('base16-colorscheme').setup({
            base00 = '#${base00}',
            base01 = '#${base01}',
            base02 = '#${base02}',
            base03 = '#${base03}',
            base04 = '#${base04}',
            base05 = '#${base05}',
            base06 = '#${base06}',
            base07 = '#${base07}',
            base08 = '#${base08}',
            base09 = '#${base09}',
            base0A = '#${base0A}',
            base0B = '#${base0B}',
            base0C = '#${base0C}',
            base0D = '#${base0D}',
            base0E = '#${base0E}',
            base0F = '#${base0F}',
        })
      '';
    }
  ];

}
