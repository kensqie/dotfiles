local toggleterm = require("toggleterm")

toggleterm.setup()

vim.keymap.set({"n", "t"}, "<C-t>", "<cmd>ToggleTerm direction=float<CR>")
