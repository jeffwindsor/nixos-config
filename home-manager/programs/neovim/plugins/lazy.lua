-- ----------------------------------------------------------------------------
--bootstrap plugin manager if not installed
-- ----------------------------------------------------------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
  'git',
  'clone',
  '--filter=blob:none',
  'https://github.com/folke/lazy.nvim.git',
  '--branch=stable', -- latest stable release
  lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

-- ----------------------------------------------------------------------------
-- load plugins
-- ----------------------------------------------------------------------------
require('lazy').setup({

  -- auto save on focus change
  { 'pocco81/auto-save.nvim' },

  -- show git gutter
  { 'lewis6991/gitsigns.nvim' },

  -- terminal app wrapper : lazygit, lf, etc.
    {"is0n/fm-nvim" },

  -- vertical line hints for indentation
  { 'lukas-reineke/indent-blankline.nvim' },

  -- lua line
  -- { 'nvim-lualine/lualine.nvim', dependencies = {'nvim-web-devicons'}},

  -- swiss army knife of plugins
  { 'echasnovski/mini.nvim', version = '*' },

  -- Autocompletion
  { 'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' }},

  -- LSP Configuration & Plugins
  { 'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', branch = 'legacy', opts = {} },
      'folke/neodev.nvim',
    }},

  -- Highlight, edit, and navigate code
  { 'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' }},

  -- fuzzy finder
  { 'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    version = '*'},

  -- auto adjust the tab length based on current files usage
  { 'tpope/vim-sleuth' },

  -- git power
  --{ 'tpope/vim-fugative', lazy = true },

  -- tmux integration
  --{ 'christoomey/vim-tmux-navigator', lazy = false },

  -- key bindings popup menu
  { 'folke/which-key.nvim' },

  -- --------------------------------------------------------------------------
  -- color schemes
  -- --------------------------------------------------------------------------
  {'folke/tokyonight.nvim'},
  {'joshdick/onedark.vim'},
  {'marko-cerovac/material.nvim'},
  {'rebelot/kanagawa.nvim'},
  {'shaunsingh/nord.nvim'},
  {'tomasr/molokai'},
  {'catppuccin/nvim'},
  {'NLKNguyen/papercolor-theme'},
  {'jacoborus/tender.vim'},
  {'cocopon/iceberg.vim'},
  {'romainl/Apprentice'},
  {'ellisonleao/gruvbox.nvim'},
})

require('plugins.auto-save')
require('plugins.gitsigns')
require('plugins.indent-blankline')
-- require('plugins.lualine')
require('plugins.mini')
require('plugins.nvim-cmp')
require('plugins.nvim-lsp')
--require('plugins.nvim-tree')
require('plugins.nvim-treesitter')
require('plugins.telescope')
require('plugins.which-key')


--require("lspconfig").lua_ls.setup {}
require('lspconfig').rust_analyzer.setup {}

