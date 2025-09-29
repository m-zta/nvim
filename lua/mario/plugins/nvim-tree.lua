local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended setting from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#69ffd5]])

nvimtree.setup({
  renderer = {
    icons = {
      glyphs = {
        folder = {
          -- arrow when folder is closed
          -- arrow_closed = "▷"
          -- arrow when folder is open
          -- arrow_open = ""
        },
      },
    },
  },
  -- for the file explorer works properly
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },

  git = {
    enable = true,
    ignore = false, -- make build files visible in the tree (added 25.02.24, 7:44pm)
  },
})
