local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	})
end

vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, "lazy")

if not status then
	print("Plugin manager not available")
	return
end

local plugins = {
	{ "gpanders/editorconfig.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "numToStr/Comment.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "akinsho/toggleterm.nvim" },
	{ "nvim-lualine/lualine.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig"
		}
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip"
		}
	}
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
			lazy = "-"
		}
	}
}

lazy.setup(plugins, options)
