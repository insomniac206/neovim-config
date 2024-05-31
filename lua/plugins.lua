return {
    "rebelot/kanagawa.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
    {"nvim-telescope/telescope.nvim", tag="0.1.6", dependencies={"nvim-lua/plenary.nvim"}},
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    {"nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons"}
}
