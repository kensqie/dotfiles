return {
	"lmburns/lf.nvim",
	dependencies = { "toggleterm.nvim" },
	config = function()
		local lf = require("lf")

		lf.setup({
			escape_quit = false,
			border = "single",
		})

		vim.keymap.set("n", "<leader>e", "<CMD>Lf<CR>", { desc = "Lf open" })
	end,
}
