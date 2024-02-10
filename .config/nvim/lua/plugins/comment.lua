return {
	"numToStr/Comment.nvim",
	config = function()
		local comment = require("Comment")

		comment.setup({
			toggler = {
				line = "<leader>c",
				block = "<leader>C",
			},
			opleader = {
				line = "<leader>c",
				block = "<leader>C",
			},
		})
	end,
}
