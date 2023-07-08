local lualine = require("lualine")

local attached_lsp = function ()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.buf_get_clients(bufnr)
	local c = {}

	if next(clients) == nil then
		return ""
	end

	for _, client in pairs(clients) do
		table.insert(c, client.name)
	end

	return table.concat(c, "  ")
end

lualine.setup({
	options = {
		icons_enabled = false,
		component_separators = {},
		section_separators = {}
	},
	sections = { lualine_x = { "encoding", "fileformat", "filetype", attached_lsp } }
})
