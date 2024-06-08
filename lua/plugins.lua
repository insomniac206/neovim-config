return {
    "rebelot/kanagawa.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {"nvim-telescope/telescope.nvim", tag="0.1.6", dependencies={"nvim-lua/plenary.nvim"}},
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    {"nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons"},
    {
        "goolord/alpha-nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('alpha').setup(require('alpha.themes.dashboard').config)
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {"c", "cpp", "python", "lua", "json", "javascript", "html", "css"},
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true }
            })
        end
    }
}
