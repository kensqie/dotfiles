local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	sync_install = false,
	auto_install = false,
	indent = { enable = true },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	}
})
