return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				vim.keymap.set("n", "<leader>h]", function()
					if vim.wo.diff then
						return "<leader>h]"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				vim.keymap.set("n", "<leader>h[", function()
					if vim.wo.diff then
						return "<leader>h["
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				vim.keymap.set({ "n", "v" }, "<leader>hs", "<CMD>Gitsigns stage_hunk<CR>")
				vim.keymap.set({ "n", "v" }, "<leader>hr", "<CMD>Gitsigns reset_hunk<CR>")
				vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk)
				vim.keymap.set("n", "<leader>hS", gs.stage_buffer)
				vim.keymap.set("n", "<leader>hR", gs.reset_buffer)
				vim.keymap.set("n", "<leader>hh", gs.preview_hunk)
				vim.keymap.set("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end)
				vim.keymap.set("n", "<leader>hB", gs.toggle_current_line_blame)
				vim.keymap.set("n", "<leader>hd", gs.diffthis)
				vim.keymap.set("n", "<leader>hD", gs.toggle_deleted)
			end,
		})
	end,
}
