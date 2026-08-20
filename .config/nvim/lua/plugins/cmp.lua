local cmp = require("cmp")

cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	}),
	completion = {
		completeopt = "menu, menuone, noinsert",
	},
	view = {
		docs = {
			auto_open = false,
		},
	},
	enabled = function()
		if vim.bo.buftype == "prompt" then
			return false
		end

		return true
	end,
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			local trim = function(text, max)
				if text and text:len() > max then
					text = text:sub(1, max) .. "..."
				end
				return text
			end
			vim_item.abbr = trim(vim_item.abbr, 30)
			return vim_item
		end,
	},
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-u>"] = cmp.mapping.scroll_docs(-5),
		["<C-d>"] = cmp.mapping.scroll_docs(5),
		["<C-q>"] = cmp.mapping.abort(),
		["<C-space>"] = cmp.mapping.complete(),
		["<C-k>"] = function()
			if cmp.visible_docs() then
				cmp.close_docs()
			else
				cmp.open_docs()
			end
		end,
		["<CR>"] = cmp.mapping.confirm({
			select = false,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if vim.snippet.active({ direction = 1 }) then
				vim.snippet.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if vim.snippet.active({ direction = -1 }) then
				vim.snippet.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
})
