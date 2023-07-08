local diagnostic = true

local toggle_diagnostic = function()
	diagnostic = not diagnostic

	if diagnostic then
		vim.diagnostic.enable()
	else
		vim.diagnostic.disable()
	end
end

vim.keymap.set("n", "<leader>S", toggle_diagnostic)
