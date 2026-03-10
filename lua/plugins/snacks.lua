return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = { enabled = true },
    indent = { enabled = true },
    input = { enabled=  true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    explorer = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          layout = {
            layout = {
              width = 30,
              min_width = 20,
            },
          },
        },
      },
    },
  },
  keys = {
    { "<leader>e", function() Snacks.picker.explorer() end, desc = "Open File Explorer" },
  },
}
