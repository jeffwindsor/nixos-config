vim.cmd 'colorscheme tender'

-- ----------------------------------------------------------------------------
-- AUTOCOMMANDS: more info @ `:h autocommands`
-- ----------------------------------------------------------------------------
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 }) end })

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell" })

-- ----------------------------------------------------------------------------
-- KEY MAPPINGS:
--    <leader> key maps moved to WHICH KEY plugin config
-- ----------------------------------------------------------------------------
local noremap = { noremap = true }                -- protects from remapping by other configs
local silent  = { noremap = true, silent = true } -- silent does not show bound command in bottom row / command output

-- PERSONAL home row improvements

vim.api.nvim_set_keymap('n', 'j', 'h', silent)
vim.api.nvim_set_keymap('n', 'k', 'j', silent)
vim.api.nvim_set_keymap('n', 'l', 'k', silent)
vim.api.nvim_set_keymap('n', ';', 'l', silent)

--paste over word
vim.api.nvim_set_keymap('n', '<C-p>', 'cw<C-r>0<ESC>', silent)

--  quick <jk> produces an <escape> while in insert mode
-- vim.api.nvim_set_keymap('i', 'jk', '<ESC>', silent)

--  buffer movement direct from CONTROL home row keys
--    left / right for tabs
vim.api.nvim_set_keymap("n", "<C-j>", "tabprev", silent)
vim.api.nvim_set_keymap("n", "<C-;>", "tabnext", silent)
--    up / down for buffers
vim.api.nvim_set_keymap("n", "<C-k>", "bprev", silent)
vim.api.nvim_set_keymap("n", "<C-l>", "bnext", silent)

--  first character in line
vim.api.nvim_set_keymap("n", "gh", "^", silent)

--  last character in line
vim.api.nvim_set_keymap("n", "gl", "$", silent)

--  return removes search highlights
vim.api.nvim_set_keymap("n", "<CR>", ":noh<CR><CR>", silent)

-- PERSONAL muscle memory improvements
--  command mode without the shift key (normal and visual mode)
-- vim.api.nvim_set_keymap('n', '\'', ':', noremap)
-- vim.api.nvim_set_keymap('v', '\'', ':', noremap)

--  yank acts like other capitol letters (normal mode)
vim.api.nvim_set_keymap('n', 'Y', 'y$', noremap)

-- advised by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

