local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()

mason_lspconfig.setup({
	ensure_installed = { "lua_ls" },
	automatic_enable = false,
})

local function installed_servers()
	local package_to_lspconfig = require("mason-lspconfig.mappings").get_mason_map().package_to_lspconfig
	local names = {}

	for _, pkg in ipairs(require("mason-registry").get_installed_package_names()) do
		local name = package_to_lspconfig[pkg]
		if name then
			table.insert(names, name)
		end
	end

	return names
end

vim.keymap.set("n", "<leader>tl", function()
	local bufnr = vim.api.nvim_get_current_buf()

	if #vim.lsp.get_clients({ bufnr = bufnr }) > 0 then
		vim.diagnostic.reset(nil, bufnr)
		pcall(vim.cmd, "lsp disable")
		return
	end

	local names = installed_servers()
	if #names > 0 then
		vim.lsp.enable(names)
	end
end, { desc = "Toggle LSP" })

vim.keymap.set("n", "<leader>l[", vim.diagnostic.goto_prev, { desc = "Diagnostics prev" })
vim.keymap.set("n", "<leader>l]", vim.diagnostic.goto_next, { desc = "Diagnostics next" })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Diagnostics open float" })

vim.keymap.set("n", "K", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1

	if #vim.diagnostic.get(bufnr, { lnum = lnum }) > 0 then
		vim.diagnostic.open_float()
	elseif #vim.lsp.get_clients({ bufnr = bufnr, method = "textDocument/hover" }) > 0 then
		vim.lsp.buf.hover()
	else
		vim.notify("LSP is not enabled", vim.log.levels.INFO)
	end
end, { desc = "Hover or diagnostics" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lspgroup", {}),
	callback = function(event)
		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
		end

		map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
		map("n", "gd", vim.lsp.buf.definition, "Goto definition")
		map("n", "gr", vim.lsp.buf.references, "Goto references")
		map("n", "R", vim.lsp.buf.rename, "Rename")
		map("n", "<leader>li", vim.lsp.buf.hover, "Code hover")
		map("n", "<leader>la", vim.lsp.buf.code_action, "Code action")
		map("n", "<leader>lf", vim.lsp.buf.format, "Format buffer")
	end,
})
