return {
	{
		"williamboman/mason.nvim",
		config = function()
			local mason = require("mason")

			mason.setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local lspconfig = require("mason-lspconfig")

			lspconfig.setup({
				ensure_installed = { "lua_ls" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local get_servers = require("mason-lspconfig").get_installed_servers
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			for _, server_name in ipairs(get_servers()) do
				lspconfig[server_name].setup({
					autostart = true,
					capabilities = lsp_capabilities,
				})
			end
		end,
	},
}
