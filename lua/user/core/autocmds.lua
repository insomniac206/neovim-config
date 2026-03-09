local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Helper to make augroup creation less verbose
local function create_augroup(name)
  return augroup(name, { clear = true })
end

-- Highlight text after yanking
autocmd("TextYankPost", {
  group = create_augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = create_augroup("trim_whitespace"),
  pattern = "*",
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end
})

-- Set indentation for specific filetypes
autocmd("FileType", {
  group = create_augroup("filetype_indent"),
  pattern = { "python" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end
})
