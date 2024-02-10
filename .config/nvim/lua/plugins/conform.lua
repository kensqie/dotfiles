return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { { "prettier", "prettierd" } },
				css = { { "prettier", "prettierd" } },
				json = { { "prettier", "prettierd" } },
				yaml = { { "prettier", "prettierd" } },
				markdown = { { "prettier", "prettierd" } },
				javascript = { { "prettier", "prettierd" } },
				typescript = { { "prettier", "prettierd" } },
				javascriptreact = { { "prettier", "prettierd" } },
				typescriptreact = { { "prettier", "prettierd" } },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({ async = true, lsp_fallback = true })
		end)
	end,
}
