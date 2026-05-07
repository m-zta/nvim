# Neovim Config Migration — Summary

## Starting state

A Packer-managed config showing a deprecation warning on startup: `client.is_stopped is deprecated`, traced to `copilot-cmp` calling the old dot-notation API instead of the new colon-notation method. The plugin is effectively unmaintained — the upstream issue has been open since 2024 with no fix.

## Goal

Rather than patching a dying plugin, modernize the whole stack to remove deprecation warnings and align with current Neovim ecosystem conventions.

## Changes

Plugin manager: Packer → lazy.nvim

- Deleted `lua/mario/plugins-setup.lua` (the Packer bootstrap + spec list).
- Added `lua/mario/lazy-bootstrap.lua` to clone lazy.nvim on first run and load all specs from `lua/mario/plugins/`.
- Each plugin file now `return`s a lazy spec table instead of imperatively calling `setup()`.
- `lazy-lock.json` now pins exact plugin commits (committed to git for reproducibility).

Completion: nvim-cmp → blink.cmp

- Replaced `nvim-cmp` + `cmp-buffer` + `cmp-path` + `cmp_luasnip` with the single `saghen/blink.cmp` plugin (Rust-backed, actively maintained, native LuaSnip + LSP + path + buffer sources built in).
- Keymaps preserved (`<C-j>`/`<C-k>` navigation, `<CR>` to accept, etc.).

Copilot: dropped copilot-cmp shim

- Removed `zbirenbaum/copilot-cmp` (the broken bridge) along with the cmp source wiring.
- Switched `copilot.lua` to its native `suggestion` module: inline ghost-text with `<Tab>` to accept, `<C-e>` to dismiss, `<M-]>`/`<M-[>` to cycle.
- Cleaner architecture: Copilot suggestions are now visually separate from LSP/snippet completions instead of being mashed into the same popup.

Treesitter: master → main branch (rewrite)

- The `main` branch is a full rewrite that removes the module framework. No more `require("nvim-treesitter.configs").setup({ ensure_installed = ..., highlight = { enable = true } })`.
- New API: `require("nvim-treesitter").install({...})` to install parsers, plus a `FileType` autocmd calling `vim.treesitter.start()` to enable highlighting per-buffer. Indent is wired via `indentexpr`.
- Required installing the `tree-sitter-cli` Homebrew formula (split out from `tree-sitter` which is now just `libtree-sitter`).
- `nvim-ts-autotag` is now a standalone plugin with its own `setup()` instead of being a treesitter module.

File reorganization

- Moved `colorscheme.lua` from `core/` to `plugins/` (lazy auto-discovers everything in `plugins/`).
- Consolidated small plugin specs: `comment.lua` + `autopairs.lua` → `editing.lua`; `lualine.lua` + `nvim-tree.lua` → `ui.lua`.
- Deleted `nvim-cmp.lua`, `comment.lua`, `lualine.lua`, `nvim-tree.lua`, `autopairs.lua` (all migrated into the new specs).
- Kept `ibl.lua` separate to preserve the custom rainbow indent colors via the `HIGHLIGHT_SETUP` hook.

`init.lua` cleanup

- Lifted `vim.g.mapleader` and `vim.g.maplocalleader` to the very top of `init.lua` — lazy.nvim requires the leader to be defined before it loads (so lazy-loaded `<leader>x` keymaps register correctly).
- Removed the long list of explicit `require()` calls; lazy now handles plugin loading.

Repo hygiene

- Updated `.gitignore` (removed Packer-era entries, kept `lazy-lock.json` tracked).
- Added `repomix.config.json` and `.repomixignore` for AI-friendly repo export.

## Incidental fixes along the way

- A Homebrew bug (`undefined method 'to_sym' for nil` in `cask_struct_generator.rb`) was hit during the `tree-sitter` install. Resolved by `brew update` to pull in the patched Homebrew 5.0.x release.

## End state

- Zero deprecation warnings (`:checkhealth vim.deprecated` clean).
- Faster startup, lazy-loaded plugins, reproducible installs via `lazy-lock.json`.
- All plugins are actively maintained.
- Aligned with current Neovim conventions (lazy + blink + native treesitter + native copilot suggestions).

## Still missing (deliberately deferred)

LSP (`nvim-lspconfig` + `mason.nvim`), a fuzzy finder (`telescope.nvim`), git integration (`gitsigns.nvim`), `which-key`, and a formatter (`conform.nvim`). The editor works; it's not yet a full IDE.
