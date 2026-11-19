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
