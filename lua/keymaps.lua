-- Normal mode mappings
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Sidebar (file explorer)" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save File" })
vim.keymap.set("n", "<Leader>p", ":Lazy<CR>", { desc = "Open Plugin Settings/List" })
vim.keymap.set("n", "<Leader>q", ":q!<CR>", { desc = "Quit Neovim" })
vim.keymap.set("n", "T", ":bn<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "C", ":bd<CR>", { desc = "Close Tab" })

local Run = require("runfile")
vim.keymap.set("n", "<leader>rf", Run.RunFile, { desc = "Run the current file" })

-- Insert mode mappings
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>i")
vim.keymap.set("i", "<C-x>", "<Esc>")

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in the current working directory" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Go to file" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help" })
