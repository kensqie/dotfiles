local mason = require("mason")
local lspconfig = require("lspconfig")
local get_servers = require("mason-lspconfig").get_installed_servers
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

mason.setup()

for _, server_name in ipairs(get_servers()) do
	lspconfig[server_name].setup({
		autostart = true,
		capabilities = lsp_capabilities
	})
end
