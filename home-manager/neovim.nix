{ config, pkgs, ... }: {
  enable = true;
  # defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  extraLuaConfig = ''
-- ----------------------------------------------------------------------------
-- OPTIONS: more info @ `:h vim.o`
-- ----------------------------------------------------------------------------
vim.g.mapleader       = " "            -- map leader to <space>
vim.g.maplocalleader  = " "            -- map local leader to <space>
vim.o.autoindent      = true
vim.o.background      = 'dark'
vim.o.backspace       = 'indent,eol,start'
vim.o.breakindent     = true          -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.
vim.o.clipboard       = 'unnamedplus'
vim.o.completeopt     = 'menuone,noselect'  -- completion: menuone=Use the popup menu also when there is only one match. noselect=force the user to select
vim.o.cursorline      = true
vim.o.encoding        = 'UTF-8'
vim.o.expandtab       = true          -- spaces over tabs
vim.o.hidden          = true          -- allow background buffers
vim.o.hlsearch        = true          -- highlight found searches
vim.o.ignorecase      = true
vim.o.inccommand      = 'split'       -- get preview of replacements
vim.o.incsearch       = true          -- show match while typing
vim.o.mouse           = 'a'           -- turn on mouse usage
vim.o.number          = true
vim.o.relativenumber  = true          -- hybrid number scheme
vim.o.ruler           = true
vim.o.shiftwidth      = 2
vim.o.smartcase       = true          -- Case insensitive searching UNLESS /C or capital in search
vim.o.smartindent     = true
vim.o.smarttab        = true
vim.o.softtabstop     = 2
vim.o.spell           = false
vim.o.spelllang       = 'en_us'
vim.o.splitbelow      = true
vim.o.splitright      = true
vim.o.tabstop         = 2
vim.o.termguicolors   = true
vim.o.undofile        = true          -- Save undo history
vim.o.wrap            = false
vim.wo.signcolumn     = 'yes'         -- always

-- ----------------------------------------------------------------------------
-- AUTOCOMMANDS: more info @ `:h autocommands`
-- ----------------------------------------------------------------------------
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 }) end })

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell" })

-- Set Comment for NIX files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.nix" },
  command = 'lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")' })

-- ----------------------------------------------------------------------------
-- KEY MAPPINGS:
--    <leader> key maps moved to WHICH KEY plugin config
-- ----------------------------------------------------------------------------
local noremap = { noremap = true }                -- protects from remapping by other configs
local silent  = { noremap = true, silent = true } -- silent does not show bound command in bottom row / command output

--  return removes search highlights
vim.api.nvim_set_keymap("n", "<CR>", ":noh<CR><CR>", silent)

--  yank acts like other capitol letters (normal mode)
vim.api.nvim_set_keymap('n', 'Y', 'y$', noremap)

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

        -- require('mini.hipatterns').setup({
        --   highlighters = {
        --     todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
        --     note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
        --     hex_color = hipatterns.gen_highlighter.hex_color(),
        --   },
        -- })

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

#    {
#      plugin = nvim-treesitter;
#      type   = "lua";
#      config = builtins.readFile(./neovim/plugins/nvim-treesitter.lua);
#    }
#
#    nvim-treesitter-textobjects
#
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
      config = ''
        local buffer_next = ':bnext<CR>'
        local wk = require('which-key')
        wk.setup()
        wk.register({
          ["<leader>"] = { ':Telescope spell_suggest<CR>', 'spelling'},
          ["."] = { ':arga $HOME/.config/nvim/lua/plugins/lazy.lua $HOME/.config/nvim/lua/plugins/which-key.lua<CR>:e arg<CR>', 'load config'},
          [","] = {
            name = 'commands',
            [","] = { ':Telescope commands<CR>','search commands'},
            a = { ':Telescope autocommands<CR>', 'search auto commands' },
            h = { ':Telescope command_history<CR>','search command history'},
            l = { ':Lazy', 'Plugin Manager (Lazy)'},
            p = { ':Telescope builtin<CR>','pickers'},
          },
          b = {
            name = 'buffers',
            b = { ':Telescope buffers<CR>','buffers'},
            c = { ':bdelete<CR>','close'},
            j = { ':bprev<CR>','previous'},
            k = { buffer_next,'next'},
            n = { ':enew<CR>','new'},
            s = { ':Telescope current_buffer_fuzzy_find<CR>', 'search text'},
            t = { ':Telescope current_buffer_tags<CR>', 'search tags' },
          },
          c = {
            name = 'color schemes',
            c = { ':Telescope colorscheme<CR>','color schemes'},
            m = { ':lua require("material.functions").find_style()<CR>', 'material' },
            k = { ':colorscheme kanagawa<CR>', 'kanagawa' },
            n = { ':colorscheme nord<CR>', 'nord' },
            t = {
              name = 'tokyo night',
              n = { ':colorscheme tokyonight-night<CR>', 'night' },
              s = { ':colorscheme tokyonight-storm<CR>', 'storm' },
              d = { ':colorscheme tokyonight-day<CR>', 'day' },
              m = { ':colorscheme tokyonight-moon<CR>', 'moon' },
            },
            ["1"] = { ':colorscheme onedark<CR>', 'one dark' },
          },
          e = {
            name = 'editor',
            c = { 'gc','toggle [c]omments (gc)'},
            j = { ':%!jq .<CR>','format [j]son'},
            l = { ':lua MiniTrailspace.trim_last_lines()<CR>', 'remove empty [l]ast lines' },
            t = { ':TaskWarriorTUI<CR>','tasks'},
            w = { ':lua MiniTrailspace.trim()<CR>', 'remove trailing [w]hitespace' },
          },
          f = {
            name = 'files',
            -- b = { ':Broot<CR>', 'via file browser'},
            b = { ':Telescope file_browser<CR>', 'file browser'},
            c = { ':Telescope find_files cwd=$XDG_CONFIG_HOME<CR>','in config directory'},
            -- d = { ':Telescope find_files find_command=yadm,list,-a<CR>','in config directory'},
            f = { ':Telescope find_files<CR>','in current directory'},
            g = { ':Telescope find_files cwd=$SRC<CR>','in git repos'},
            h = { ':Telescope find_files cwd=$HOME<CR>','in home directory'},
            i = { ':Telescope find_files cwd=$INSTALLS<CR>','in install files directory'},
            s = { ':Telescope live_grep<CR>','grep'},
            t = { ':Telescope filetypes<CR>','set file type'},
          },
          g = {
            name = 'git',
            b = { ':Telescope git_branches<CR>','branches'},
            c = { ':Telescope git_commits<CR>','commits'},
            f = { ':Telescope git_files<CR>','files'},
            s = { ':Telescope git_status<CR>','status'},
            u = { ':Gitui','git ui'},
            --l = { ':Lazygit','lazy git'},
          },
          h = {
            name = 'help',
            h = { ':Telescope help_tags<CR>','topics'},
            m = { ':Telescope help_tags<CR>','man-pages'},
          },
          j = { ':Telescope jumplist<CR>', 'jump lists'},
          k = { ':Telescope keymaps<CR>', 'key maps'},
          l = {
            name = 'lsp',
            d = { ':Telescope lsp_definitions<CR>','definition'},
            i = { ':Telescope lsp_implementations<CR>','implementations'},
            r = { ':Telescope lsp_references<CR>','references'},
            t = { ':Telescope lsp_type_definitions<CR>','type'},
          },
          p = { ':Lazy<CR>', 'package manager'},
          q = { ':qa<CR>','quit'},
          r = { ':Telescope registers<CR>','registers'},
          t = {
            name = 'tabs',
            c = { ':tabclose<CR>','close'},
            j = { ':tabprevious<CR>','previous'},
            k = { ':tabnext<CR>','next'},
            n = { ':tabnew<CR>','new'},
          },
          w = {
            name = 'windows',
            c = { ':close<CR>','close'},
            h = {'<C-W><left>','left'},
            j = {'<C-W><down>','down'},
            k = {'<C-W><up>','up'},
            l = {'<C-W><right>','right'},
            s = { ':split<CR>' .. buffer_next,'split down'},
            v = { ':vsplit<CR>' .. buffer_next,'split right'},
            x = {
              name = 'resize',
              h = { ':vertical resize -5<CR>','left'},
              j = { ':resize -5<CR>','down'},
              k = { ':resize +5<CR>','up'},
              l = { ':vertical resize +5<CR>','right'},
            },
          },
          x = { ':qa!<CR>', 'force quit'},
        },
        { prefix = '<leader>'}
      );
      '';
    }
  ];

}
