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

