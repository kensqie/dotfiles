local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		sorting_strategy = "ascending",
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		path_display = { "filename_first" },
		dynamic_preview_title = true,
		layout_config = {
			prompt_position = "top",
			horizontal = { preview_width = 0.6 },
		},
		file_ignore_patterns = {
			".git/",
			".venv/",
			"vendor/",
			"node_modules/",
		},
		mappings = {
			n = {
				["D"] = "delete_buffer",
			},
			i = {
				["<CR>"] = actions.select_default + actions.center,
			},
		},
	},
	pickers = {
		live_grep = {
			additional_args = function(_)
				return { "--hidden" }
			end,
		},
		find_files = {
			hidden = true,
		},
	},
})

vim.keymap.set("n", "<leader>jt", builtin.builtin, { desc = "Telescope" })
vim.keymap.set("n", "<leader>jR", builtin.oldfiles, { desc = "Telescope recent files" })
vim.keymap.set("n", "<leader>jr", builtin.resume, { desc = "Telescope resume last search" })
vim.keymap.set("n", "<leader>js", builtin.live_grep, { desc = "Telescope grep" })
vim.keymap.set("n", "<leader>jg", builtin.git_status, { desc = "Telescope git status" })
vim.keymap.set("n", "<leader>jd", builtin.diagnostics, { desc = "Telescope diagnostics" })
vim.keymap.set("n", "<leader>jo", builtin.treesitter, { desc = "Telescope treesitter" })
vim.keymap.set("n", "<leader>jb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>jF", function()
	builtin.find_files({ no_ignore = true })
end, { desc = "Telescope find files no ignore" })
vim.keymap.set("n", "<leader>jf", function()
	vim.fn.system({ "git", "rev-parse", "--is-inside-work-tree" })
	if vim.v.shell_error == 0 then
		builtin.git_files({ show_untracked = true })
	else
		builtin.find_files()
	end
end, { desc = "Telescope find files" })
vim.keymap.set("x", "<leader>js", function()
	vim.cmd('noau normal! "vy"')
	local selection = vim.fn.getreg("v")
	builtin.grep_string({ search = selection })
end, { desc = "Telescope grep selection" })
