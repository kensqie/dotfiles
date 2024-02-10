vim.g.mapleader = " "
vim.diagnostic.config({ signs = false })

local options = {
	encoding = "utf-8",
	signcolumn = "yes",
	termguicolors = true,
	pumheight = 10,
	number = true,
	relativenumber = true,
	showmode = false,
	incsearch = true,
	hlsearch = false,
	ignorecase = true,
	smartcase = true,
	backup = false,
	swapfile = false,
	tabstop = 4,
	shiftwidth = 4,
	expandtab = false,
	foldmethod = "indent",
	foldlevelstart = 999,
	wrap = false,
	list = false,
	listchars = "tab:→ ,space:·,nbsp:␣,extends:<,precedes:>",
}

for option, value in pairs(options) do
	vim.opt[option] = value
end
