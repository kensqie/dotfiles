return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			ensure_installed = { "vim", "vimdoc", "comment", "lua", "c" },
			sync_install = false,
			auto_install = false,
			indent = { enable = true },
			highlight = { enable = true },
		})
	end,
}
