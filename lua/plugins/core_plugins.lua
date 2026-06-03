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
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      tabline = {
        lualine_a = {
          {
            'buffers',
            show_filename_only = true,
            hide_filename_extension = false,
            show_modified_status = true,
          },
        },
      },
    },
  },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {}, },
  {
    'mason-org/mason.nvim',
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  { "neovim/nvim-lspconfig" },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "pyright", "ruff", "lua_ls", "clangd", "ts_ls", "html", "cssls", "emmet_ls" },
    },
    dependecies = {
      { "mason-org/mason.nvim" },
      { "neovim/nvim-lspconfig" },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",

    opts = {
      keymap = { preset = 'default' },
      appearance = { nerd_font_variant = 'mono' },
      completion = { documentation = { auto_show = false } },
      sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
      fuzzy = { implementation = 'prefer_rust' },
    },
  },

}
