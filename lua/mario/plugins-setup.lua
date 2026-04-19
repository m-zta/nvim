-- /lua/mario/plugins-setup.lua

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    -- packer managing
    use("wbthomason/packer.nvim")

    -- lua functions that are used by many plugins
    use("nvim-lua/plenary.nvim")

    -- commenting with gc
    use("numToStr/Comment.nvim")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")

    -- icons
    use("kyazdani42/nvim-web-devicons")

    -- statusline
    use("nvim-lualine/lualine.nvim")

    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    -- copilot (LSP-based, replaces github/copilot.vim)
    use("zbirenbaum/copilot.lua")
    use("zbirenbaum/copilot-cmp")

    -- snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- treesitter
    use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
    end,
    })

    -- auto closing
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

    -- indent blankline, this adds the indentation lines in block codes
    use("lukas-reineke/indent-blankline.nvim")

    -- ---------------------------------------------------------
    -- Color schemes
    -- ---------------------------------------------------------

    -- color scheme: nightfly
    use { "bluz71/vim-nightfly-colors", as = "nightfly" }

    -- color scheme: catppuccin
    use { "catppuccin/nvim", as = "catppuccin" }

    -- color scheme: kat
    use { "katawful/kat.nvim", tag = '3.1'}

    -- color scheme: moonlight
    use { "shaunsingh/moonlight.nvim", as = "moonlight" }

    -- color scheme: moonfly
    use { "bluz71/vim-moonfly-colors", as = "moonfly" }

    -- color scheme: aurora
    -- had to install manually instead of using packer
    -- according to the github page. Still didn't work...
    -- use {
    --    'daltonmenezes/aura-theme',
    --    config = function()
    --        vim.cmd 'colorscheme aura'
    --    end
    -- }
    
    -- ---------------------------------------------------------
 
  if packer_bootstrap then
    require("packer").sync()
  end
end)
