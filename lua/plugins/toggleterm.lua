return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
      title_pos = 'left',
    },
  },
  config = function (_, opts)
    require("toggleterm").setup(opts)

    local Terminal = require("toggleterm.terminal").Terminal
    local py_repl = Terminal:new({
      cmd = "python3",
      hidden = true,
      direction = "float",
      float_opts = { border = "curved" },
    })
    function _PY_TOGGLE()
      py_repl:toggle()
    end
    vim.keymap.set("n", "<leader>tp", _PY_TOGGLE, { desc = "Toggle python repl" })

    local runner = require("user.runfile")
    vim.keymap.set("n", "<leader>rr", runner.run_file, { desc = 'Run current file' })

    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = "term://*",
      callback = function ()
        local buffer_opts = { buffer = 0 }
        vim.keymap.set('t', '<C-e>', [[<C-\><C-n>]], buffer_opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], buffer_opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], buffer_opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], buffer_opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], buffer_opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], buffer_opts)
      end,
    })
  end
}
