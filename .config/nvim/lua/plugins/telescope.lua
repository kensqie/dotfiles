return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				path_display = { "truncate" },
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

		vim.keymap.set("n", "<leader>tF", function()
			builtin.find_files({ no_ignore = true })
		end, { desc = 'Telescope find files no ignore' })
		vim.keymap.set("n", "<leader>tt", builtin.builtin, { desc = 'Telescope' })
		vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set("n", "<leader>tr", builtin.oldfiles, { desc = 'Telescope recent files' })
		vim.keymap.set("n", "<leader>ts", builtin.live_grep, { desc = 'Telescope grep' })
		vim.keymap.set("n", "<leader>tg", builtin.git_status, { desc = 'Telescope git status' })
		vim.keymap.set("n", "<leader>td", builtin.diagnostics, { desc = 'Telescope diagnostics' })
		vim.keymap.set("n", "<leader>to", builtin.treesitter, { desc = 'Telescope treesitter' })
		vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = 'Telescope buffers' })
	end,
}
