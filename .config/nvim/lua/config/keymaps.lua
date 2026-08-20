vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set({ "n", "v" }, "<C-a>", "ggVG")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>c", "gcc", { remap = true, desc = "Toggle comment line" })
vim.keymap.set("x", "<leader>c", "gc", { remap = true, desc = "Toggle comment" })

vim.keymap.set("n", "<leader>kw", "<CMD>bdelete<CR>", { desc = "Delete buffer" })

vim.keymap.set({ "n", "v" }, "<leader>ky", [["+y]], { desc = "Copy in global buffer" })
vim.keymap.set("x", "<leader>kp", [["_dP]], { desc = "Paste without change buffer" })

vim.keymap.set("n", "<leader>tb", "<CMD>let &bg=(&bg=='light'?'dark':'light')<CR>", { desc = "Toggle background" })
vim.keymap.set("n", "<leader>tz", "<CMD>set wrap!<CR>", { desc = "Toggle text wrap" })
vim.keymap.set("n", "<leader>tw", "<CMD>set list!<CR>", { desc = "Toggle render whitespace" })
vim.keymap.set("n", "<leader>th", "<CMD>set nohlsearch!<CR>", { desc = "Toggle search highlight" })
