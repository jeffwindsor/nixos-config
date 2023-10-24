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
    {
      plugin = auto-save-nvim;
      type   = "lua";
      config = "require('auto-save').setup({ enabled = true })";
    }
    {
      plugin = gitsigns-nvim;
      type   = "lua";
      config = "require('gitsigns').setup()";
    }
    {
      plugin = mini-nvim;
      type   = "lua";
      config = with config.colorScheme.colors; ''
        -- require('mini.clue').setup()
        -- require('mini.completion').setup()
        -- require('mini.files').setup()
        -- require('mini.move').setup()

        require('mini.ai').setup()
        require('mini.align').setup()
        require('mini.comment').setup()
        require('mini.cursorword').setup()      -- highlight word under cursor matches
        require('mini.jump2d').setup()          -- leap like jumps / finds
        require('mini.surround').setup()        -- surrond object with ({', etc
        require('mini.trailspace').setup()      -- highlights trailing whitespace


        require('mini.base16').setup({
          palette = {
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
          }})

        require('mini.hipatterns').setup({
          highlighters = {
            todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
            note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
            hex_color = hipatterns.gen_highlighter.hex_color(),
          },
        })

        require('mini.indentscope').setup({symbol='┊'})

        require('mini.statusline').setup({config = {
          use_icons = true,
          set_vim_settings = true,
        }})

        require('mini.tabline').setup({config = {
          show_icons = true,
          set_vim_settings = true,
          tabpage_section = 'left'
        }})

      '';
    }
    # COMPLETION
    # {
    #   plugin = nvim-cmp;
    #   type   = "lua";
    #   config = builtins.readFile(./neovim/plugins/nvim-cmp.lua);
    # }
    # cmp-nvim-lsp
    # luasnip
    # cmp_luasnip
    nvim-colorizer-lua
    nvim-treesitter
    nvim-treesitter-textobjects
    {
      plugin = telescope-nvim;
      type   = "lua";
      config = ''
        require('telescope').setup({
          defaults = {
            layout_strategy = 'vertical',
            layout_config = { prompt_position = 'top' },
            sorting_strategy = 'ascending'
            }
          })
      '';
    }
    plenary-nvim
    {
      plugin = telescope-file-browser-nvim;
      type   = "lua";
      config = "require('telescope').load_extension 'file_browser'";
    }
    vim-sleuth
    {
      plugin = which-key-nvim;
      type   = "lua";
      config = builtins.readFile(./neovim/plugins/which-key-nvim.lua);
    }
  ];

}
