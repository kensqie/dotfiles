return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "vim", "vimdoc", "comment", "lua", "c" },
			sync_install = false,
			auto_install = false,
			indent = { enable = true },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})


		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			callback = function(args)
				local bufnr = args.buf
				local ft = vim.bo[bufnr].filetype

				if ft and ft ~= "" then
					pcall(vim.treesitter.start, bufnr)
				end
			end,
		})
	end,
}
