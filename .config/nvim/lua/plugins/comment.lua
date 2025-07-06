return {
	"numToStr/Comment.nvim",
	config = function()
		local comment = require("Comment")

		comment.setup({
			toggler = {
				line = "<leader>c",
			},
			opleader = {
				line = "<leader>c",
			},
		})
	end,
}
