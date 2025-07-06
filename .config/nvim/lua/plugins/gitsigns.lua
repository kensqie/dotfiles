return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				vim.keymap.set("n", "<leader>g]", function()
					if vim.wo.diff then
						return "<leader>g]"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Gitsigns next hunk" })

				vim.keymap.set("n", "<leader>g[", function()
					if vim.wo.diff then
						return "<leader>g["
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Gitsigns prev hunk" })

				vim.keymap.set({ "n", "v" }, "<leader>gs", "<CMD>Gitsigns stage_hunk<CR>",
					{ desc = "Gitsigns stage hunk" })
				vim.keymap.set({ "n", "v" }, "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>",
					{ desc = "Gitsigns reset hunk" })
				vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Gitsigns undo stage hunk" })
				vim.keymap.set("n", "<leader>gh", gs.preview_hunk, { desc = "Gitsigns preview hunk" })
				vim.keymap.set("n", "<leader>gS", gs.stage_buffer, { desc = "Gitsigns stage buffer" })
				vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { desc = "Gitsigns reset buffer" })
				vim.keymap.set("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, { desc = "Gitsigns blame line" })
				vim.keymap.set("n", "<leader>gB", gs.toggle_current_line_blame, { desc = "Gitsigns toggle line blame" })
				vim.keymap.set("n", "<leader>gd", gs.diffthis, { desc = "Gitsigns diff" })
			end,
		})
	end,
}
