local numberGroup = vim.api.nvim_create_augroup("numbertoggle", {})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
	pattern = "*",
	group = numberGroup,
	callback = function()
		if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
	pattern = "*",
	group = numberGroup,
	callback = function()
		if vim.o.nu then
			vim.opt.relativenumber = false
			vim.cmd("redraw")
		end
	end,
})

local textGroup = vim.api.nvim_create_augroup("textgroup", {})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = "*",
	group = textGroup,
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 50,
		})
	end,
})
