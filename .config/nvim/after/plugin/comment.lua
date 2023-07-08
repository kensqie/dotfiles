local comment = require("Comment")

comment.setup({
	padding = true,
	sticky = true,
	ignore = nil,
	pre_hook = nil,
	post_hook = nil,
	mappings = {
		basic = true,
		extra = false
	},
	toggler = {
		line = "<leader>c",
		block = "<leader>C"
	},
	opleader = {
		line = "<leader>c",
		block = "<leader>C"
	}
})
