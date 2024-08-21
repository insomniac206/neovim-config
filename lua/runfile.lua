local runfile = {}
local registered_terminals = {}

function runfile.RunPyFile(file_path)
	if not registered_terminals[file_path] then
		local command = string.format(":terminal pwsh --NoLogo")
		vim.cmd(command)
		registered_terminals[file_path] = vim.api.nvim_get_current_buf()
		local cmdline_command = string.format("ipy12 %s<CR>", file_path)
		vim.api.nvim_input(cmdline_command)
	else
		vim.cmd(string.format(":buffer %d", registered_terminals[file_path]))
		vim.api.nvim_input(string.format("ipy12 %s<CR>", file_path))
	end
end

local filetypes = {
	["python"] = runfile.RunPyFile,
}

function runfile.RunFile()
	local current_file_path = vim.api.nvim_buf_get_name(0)
	local filetype = vim.bo.filetype

	local func = filetypes[filetype]
	if func then
		func(current_file_path)
	else
		print("No config for this filetype.")
		print(filetypes["python"])
	end
end

return runfile
