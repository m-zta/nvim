return {
{ "nvim-lualine/lualine.nvim",         opts = {} },
{ "nvim-tree/nvim-tree.lua",            opts = {
git = { enable = true, ignore = false },
actions = { open_file = { window_picker = { enable = false } } },
}},
{ "nvim-tree/nvim-web-devicons",        lazy = true },
}
