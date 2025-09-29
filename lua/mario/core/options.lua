-- To see a list of all the available options, run :help options.

-- line numbers
vim.opt.relativenumber = true
vim.opt.number= true
vim.opt.fillchars = { eob = " " } -- hide ~ at end of buffer

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- backspace
vim.opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- neovim uses clipboard to copy stuff

-- split windows
vim.opt.splitright = true -- split new terminal to the right
vim.opt.splitbelow = true -- split new terminal below

vim.opt.iskeyword:append("-") -- makes deleting words like "abc-cde" quicker

-- set no gui background
vim.api.nvim_command([[
    augroup ChangeBackgroudColour
        autocmd colorscheme * :hi normal guibg=NONE
    augroup END
]])
