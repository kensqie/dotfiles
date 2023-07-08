vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>bdelete<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>s", "<cmd>let &scl=(&scl=='yes'?'no':'yes')<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>let &bg=(&bg=='light'?'dark':'light')<CR>")

vim.keymap.set("n", "<leader>z", "<cmd>set wrap!<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>set list!<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>set nohlsearch!<CR>")

vim.keymap.set("n", "<leader>gH", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>g[", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>g]", vim.diagnostic.goto_next)

vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>gR", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover)
