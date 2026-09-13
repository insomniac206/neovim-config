local Terminal = require("toggleterm.terminal").Terminal

local M = {}

-- filetype -> function(file) -> shell command string
local runners = {
  python = function(file) return ("python3 %s"):format(file) end,
  sh = function(file) return ("bash %s"):format(file) end,
}

-- Wait for the next keypress *while still in this terminal window*,
-- then close it. If the user switches away first, just stop listening.
local function close_on_next_key(term)
  local ns
  ns = vim.on_key(function()
    vim.on_key(nil, ns) -- remove this listener after it fires once
    vim.schedule(function()
      if vim.api.nvim_get_current_buf() == term.bufnr
        and term.window
        and vim.api.nvim_win_is_valid(term.window)
      then
        term:close()
      end
    end)
  end)
end

function M.run_file()
  local ft = vim.bo.filetype
  local build = runners[ft]

  if not build then
    vim.notify("No runner configured for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  local cmd = build(vim.fn.expand("%:p"))

  local term = Terminal:new({
    cmd = cmd,
    direction = "float",
    close_on_exit = false, -- keep buffer open when the job finishes
    float_opts = { border = "curved" },
    on_exit = function(t)
      close_on_next_key(t)
    end,
  })

  term:toggle()
end

return M
