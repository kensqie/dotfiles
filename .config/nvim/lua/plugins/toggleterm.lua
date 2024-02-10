return {
	"akinsho/toggleterm.nvim",
	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup()

		vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>ToggleTerm direction=float<CR>")
	end,
}
