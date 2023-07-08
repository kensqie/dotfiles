local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		sorting_strategy = "ascending",
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		path_display = { "truncate" },
		layout_config = {
			prompt_position = "top",
			horizontal = { preview_width = 0.6 }
		},
		file_ignore_patterns = {
			".git/",
			"vendor/",
			"node_modules/"
		},
		mappings = {
			n = {
				["D"] = "delete_buffer"
			}
		}
	}
})

vim.keymap.set("n", "<leader>pF", function() builtin.find_files({ hidden = true, no_ignore = true }) end)
vim.keymap.set("n", "<leader>pf", builtin.find_files)
vim.keymap.set("n", "<leader>pg", builtin.live_grep)
vim.keymap.set("n", "<leader>pH", builtin.git_files)
vim.keymap.set("n", "<leader>ph", builtin.git_status)
vim.keymap.set("n", "<leader>pd", builtin.diagnostics)
vim.keymap.set("n", "<leader>po", builtin.treesitter)
vim.keymap.set("n", "<leader>pt", builtin.builtin)
vim.keymap.set("n", "<leader>pb", builtin.buffers)
vim.keymap.set("n", "<leader>pm", builtin.marks)
