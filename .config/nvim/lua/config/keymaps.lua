vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set({ "n", "v" }, "<C-a>", "ggVG")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>e", "<CMD>Explore<CR>")
vim.keymap.set("n", "<leader>w", "<CMD>bdelete<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>s", "<CMD>let &scl=(&scl=='yes'?'no':'yes')<CR>")
vim.keymap.set("n", "<leader>b", "<CMD>let &bg=(&bg=='light'?'dark':'light')<CR>")

vim.keymap.set("n", "<leader>Z", "<CMD>set wrap!<CR>")
vim.keymap.set("n", "<leader>l", "<CMD>set list!<CR>")
vim.keymap.set("n", "<leader>h", "<CMD>set nohlsearch!<CR>")

vim.keymap.set("n", "<C-k>", vim.diagnostic.open_float)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>g[", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>g]", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "R", vim.lsp.buf.rename)
