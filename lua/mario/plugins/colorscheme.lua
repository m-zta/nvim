return {
  { "shaunsingh/moonlight.nvim", priority = 1000, config = function()
      vim.cmd("colorscheme moonlight")
  end },
  -- keep these around for easy switching:
  { "bluz71/vim-nightfly-colors", lazy = true },
  { "bluz71/vim-moonfly-colors",  lazy = true },
  { "catppuccin/nvim",            lazy = true },
}
