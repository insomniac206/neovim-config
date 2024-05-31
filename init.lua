vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Personal editor settings
require "lua/keymaps"
require "lua/alpha-config"

-- Set colorscheme
vim.cmd("colorscheme kanagawa-dragon")

-- Plugins
require("nvim-tree").setup()
require("bufferline").setup()
require("lualine").setup()
require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            ".git",
            "node_modules"
        }
    }
})
require("mason").setup()
require("mason-lspconfig").setup()
