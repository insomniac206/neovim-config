return {
  -- colorscheme
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme kanagawa-dragon")
    end
  },
  -- These two plugins are dependencies of quite a few other plugins
  { 'nvim-tree/nvim-web-devicons', opts = {} },
  { 'nvim-lua/plenary.nvim', opts = {} },
  -- Utilities
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {}, },
}
