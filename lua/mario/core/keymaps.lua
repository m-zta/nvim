-- /lua/mario/core/keymaps.lua

-- allows us to set custom keyboard shortcuts that
-- don't clash with the vim defaults.
-- The leader key
-- will therefore be the space key, which is easier
-- to access than the vim default leader key '\'
vim.g.mapleader = " "

-- general keymaps
vim.keymap.set("i", "jk", "<ESC>") -- when entering insert mode, using 'jk' will be the same as using <esc>

-- Move lines up and down with opt + Up/Down in normal, visual and insert mode
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<A-Up>', ':m .-2<CR>', opts)
vim.api.nvim_set_keymap('i', '<A-Up>', '<Esc>:m .-2<CR>gi', opts)
vim.api.nvim_set_keymap('v', '<A-Up>', ":m '<-2<CR>gv=gv", opts)
vim.api.nvim_set_keymap('n', '<A-Down>', ':m .+1<CR>', opts)
vim.api.nvim_set_keymap('i', '<A-Down>', '<Esc>:m .+1<CR>gi', opts)
vim.api.nvim_set_keymap('v', '<A-Down>', ":m '>+1<CR>gv=gv", opts)

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle Tree with space + E
vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>") -- focus Tree with space + F


