# Neovim Configuration

A modular, Lua-based Neovim configuration managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Stack

- **Plugin manager:** [`lazy.nvim`](https://github.com/folke/lazy.nvim) — declarative specs, lazy-loading, lockfile-based reproducible installs
- **Completion:** [`blink.cmp`](https://github.com/saghen/blink.cmp) — Rust-backed, with LSP, path, buffer, and LuaSnip sources
- **AI suggestions:** [`copilot.lua`](https://github.com/zbirenbaum/copilot.lua) — native inline ghost-text via `<Tab>`
- **Syntax & parsing:** [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) (`main` branch) + [`nvim-ts-autotag`](https://github.com/windwp/nvim-ts-autotag)
- **File explorer:** [`nvim-tree.lua`](https://github.com/nvim-tree/nvim-tree.lua)
- **Statusline:** [`lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim)
- **Indent guides:** [`indent-blankline.nvim`](https://github.com/lukas-reineke/indent-blankline.nvim) with custom rainbow colors
- **Editing:** [`Comment.nvim`](https://github.com/numToStr/Comment.nvim), [`nvim-autopairs`](https://github.com/windwp/nvim-autopairs)
- **Snippets:** [`LuaSnip`](https://github.com/L3MON4D3/LuaSnip) + [`friendly-snippets`](https://github.com/rafamadriz/friendly-snippets)
- **Colorscheme:** `moonlight` (with `nightfly`, `moonfly`, `catppuccin` available)

## Structure

```bash
.
├── init.lua                       # Entry: leader keys + bootstraps lazy + loads core
├── lazy-lock.json                 # Pinned plugin versions (committed)
└── lua/mario/
    ├── lazy-bootstrap.lua         # Installs lazy.nvim, loads all plugin specs
    ├── core/
    │   ├── options.lua            # vim.opt settings (numbers, tabs, clipboard, …)
    │   └── keymaps.lua            # Global keymaps (jk → ESC, line-move, tree toggle)
    └── plugins/                   # Auto-discovered by lazy
        ├── cmp.lua                # blink.cmp + LuaSnip + friendly-snippets
        ├── colorscheme.lua        # Active + alternate themes
        ├── copilot.lua            # GitHub Copilot (native suggestions)
        ├── editing.lua            # Comment, autopairs, plenary
        ├── ibl.lua                # Indent guides with custom rainbow palette
        ├── treesitter.lua         # Parsers + FileType-driven highlighting
        └── ui.lua                 # lualine, nvim-tree, web-devicons
```

## Key bindings

Leader is `<Space>`.

| Mode   | Key                   | Action                     |
| ------ | --------------------- | -------------------------- |
| insert | `jk`                  | Exit to normal mode        |
| n/i/v  | `<A-Up>` / `<A-Down>` | Move line(s) up / down     |
| normal | `<leader>e`           | Toggle file tree           |
| normal | `<leader>f`           | Focus file tree            |
| insert | `<Tab>`               | Accept Copilot suggestion  |
| insert | `<C-j>` / `<C-k>`     | Next / previous completion |
| insert | `<CR>`                | Confirm completion         |
| insert | `<C-Space>`           | Trigger completion         |

## Requirements

- Neovim ≥ 0.11
- `git`, a C compiler (`cc` via Xcode CLT on macOS)
- [`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter) — required by nvim-treesitter `main` branch to build parsers
- A Nerd Font for icons
- A GitHub Copilot subscription (run `:Copilot auth` on first launch)

## Installation

```bash
git clone <this-repo> ~/.config/nvim
nvim
```

On first launch, lazy.nvim bootstraps itself, installs all plugins at the commits pinned in `lazy-lock.json`, and treesitter compiles the configured parsers. Subsequent launches are fast.

## Maintenance

| Command           | Purpose                          |
| ----------------- | -------------------------------- |
| `:Lazy`           | Plugin manager UI                |
| `:Lazy sync`      | Install / update / clean plugins |
| `:Lazy profile`   | Per-plugin startup time          |
| `:checkhealth`    | Diagnose configuration issues    |
| `:Copilot status` | Verify Copilot connection        |
