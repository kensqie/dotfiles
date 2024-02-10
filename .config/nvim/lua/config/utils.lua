local zen_disabled = true

local toggle_zen = function()
	zen_disabled = not zen_disabled

	if zen_disabled then
		vim.opt.ruler = true
		vim.opt.showcmd = true
		vim.opt.laststatus = 2
		vim.opt.signcolumn = "yes"
		vim.diagnostic.enable()
	else
		vim.opt.ruler = false
		vim.opt.showcmd = false
		vim.opt.laststatus = 0
		vim.opt.signcolumn = "no"
		vim.diagnostic.disable()
	end
end

vim.keymap.set("n", "<leader>z", toggle_zen)
