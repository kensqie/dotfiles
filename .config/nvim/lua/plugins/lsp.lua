local mason = require("mason")
local lspconfig = require("mason-lspconfig")

mason.setup()

lspconfig.setup({
	ensure_installed = { "lua_ls" },
	automatic_enable = true,
})
