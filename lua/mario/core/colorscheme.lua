-- Change colorscheme like this:
-- Replace the next line with
-- ... pcall(vim.cmd, "colorscheme nightfly") 
-- ... pcall(vim.cmd, "colorscheme moonfly")
-- ... pcall(vim.cmd, "colorscheme catppuccin")
-- ... pcall(vim.cmd, "colorscheme moonlight")
-- ... pcall(vim.cmd, "colorscheme kat.nvim")
-- and remember to also change the colorscheme in the plugins-setup.lua

local status, _ = pcall(vim.cmd, "colorscheme moonlight")

if not status then
  print("The bloody colorscheme you chose was not found!")
  return
end

-- Lua initialization file
-- vim.g.moonflyTransparent = true

require("ibl").setup()
