local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, "lazy")

if not status then
	print("Plugin manager is not available")
	return
end

local plugins = {
	{ import = "plugins" },
}

local options = {
	ui = {
		icons = {
			cmd = "-",
			config = "-",
			event = "-",
			ft = "-",
			init = "-",
			keys = "-",
			plugin = "-",
			runtime = "-",
			source = "-",
			start = "-",
			task = "-",
			lazy = "-",
			import = "-",
			loaded = "-",
			not_loaded = "-",
			require = "-",
		},
	},
}

lazy.setup(plugins, options)
