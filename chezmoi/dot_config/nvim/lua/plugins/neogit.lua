local neogit = require("neogit")

neogit.setup({})

vim.keymap.set("n", "<leader>gg", "<CMD>Neogit<CR>", { desc = "Open Neogit" })
