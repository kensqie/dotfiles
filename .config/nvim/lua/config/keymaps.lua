vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set({ "n", "v" }, "<C-a>", "ggVG")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>ke", "<CMD>Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>kw", "<CMD>bdelete<CR>", { desc = "Delete buffer" })

vim.keymap.set({ "n", "v" }, "<leader>ky", [["+y]], { desc = "Copy in global buffer" })
vim.keymap.set("x", "<leader>kp", [["_dP]], { desc = "Paste without change buffer" })

vim.keymap.set("n", "<leader>kb", "<CMD>let &bg=(&bg=='light'?'dark':'light')<CR>", { desc = "Toggle background" })

vim.keymap.set("n", "<leader>kz", "<CMD>set wrap!<CR>", { desc = "Toggle text wrap" })
vim.keymap.set("n", "<leader>kl", "<CMD>set list!<CR>", { desc = "Toggle render whitespace" })
vim.keymap.set("n", "<leader>kh", "<CMD>set nohlsearch!<CR>", { desc = "Toggle search highlight" })

vim.keymap.set("n", "<leader>k[", vim.diagnostic.goto_prev, { desc = "Diagnostics prev"})
vim.keymap.set("n", "<leader>k]", vim.diagnostic.goto_next, { desc = "Diagnostics next"})
vim.keymap.set("n", "<leader>kk", vim.diagnostic.open_float, { desc = "Diagnostics open float"})
vim.keymap.set("n", "<leader>kf", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>k.", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>ki", vim.lsp.buf.hover, { desc = "Code hover"})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "R", vim.lsp.buf.rename)
