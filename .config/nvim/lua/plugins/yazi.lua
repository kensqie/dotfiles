vim.g.loaded_netrwPlugin = 1

require("yazi").setup({
	open_for_directories = true,
})

vim.keymap.set("n", "<leader>ke", "<CMD>Yazi<CR>", {
	desc = "Open Yazi",
	silent = true,
})
