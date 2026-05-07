return {
  { "numToStr/Comment.nvim",   opts = {} },
  { "windwp/nvim-autopairs",   event = "InsertEnter", opts = {
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        java = false,
      },
  }},
  { "nvim-lua/plenary.nvim",   lazy = true },
}
