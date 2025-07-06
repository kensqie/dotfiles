return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		prompt = {
			enabled = false
		},
		highlight = {
			groups = {
				backdrop = "",
			},
		},
	},
	keys = {
		{ "<leader>s", mode = { "n", "v" }, function() require("flash").jump() end, desc = "Flash" },
	},
}
