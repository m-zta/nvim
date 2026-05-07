-- Must be set BEFORE lazy.nvim loads
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("mario.lazy-bootstrap")  -- new: sets up lazy.nvim
require("mario.core.options")
require("mario.core.keymaps")
-- plugins, colorscheme, etc. are now managed by lazy
