return {
	{
		"neovim/nvim-lspconfig",
	},

	{
		"mason-org/mason.nvim",
		config = function()
			local mason = require("mason")

			mason.setup()
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			local lspconfig = require("mason-lspconfig")

			lspconfig.setup({
				ensure_installed = { "lua_ls" },
				automatic_enable = true,
			})
		end,
	},
}
