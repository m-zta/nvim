return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local highlight = {
        "RainbowViolet", "RainbowBlue", "RainbowCyan", "RainbowGreen",
        "RainbowYellow", "RainbowOrange", "RainbowRed",
      }

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#7B6BDE" })
        vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#0091F1" })
        vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#00EEE9" })
        vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#00C541" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#D7DF4A" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#EC8A47" })
        vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#F05E67" })
      end)

      require("ibl").setup({ indent = { highlight = highlight } })
    end,
  },
}
