return {
  'nvim-telescope/telescope.nvim',
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
    { '<leader>fs', '<cmd>Telescope grep_string<cr>', desc = 'Find String under cursor' },
  },
  opts = {
    defaults = {
      path_display = { "smart" },
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
  end
}
