return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local parsers = {
        "c", "cpp", "c_sharp", "json", "javascript", "typescript",
        "yaml", "html", "css", "markdown", "markdown_inline", "php",
        "python", "tsx", "sql", "svelte", "swift", "bash", "lua",
        "vim", "vimdoc", "gitignore",
      }

      require("nvim-treesitter").install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
          if lang and pcall(vim.treesitter.start, args.buf, lang) then
            -- treesitter-based indent
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  { "windwp/nvim-ts-autotag", opts = {} },
}
