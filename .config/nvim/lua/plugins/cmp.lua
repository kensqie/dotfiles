return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
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
					luasnip.lsp_expand(args.body)
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
				["<C-e>"] = cmp.mapping.abort(),
				["<C-space>"] = cmp.mapping.complete(),
				["<C-g>"] = function()
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
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},
		})

		local leave_snippet = function()
			if
				((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
				and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
				and not luasnip.session.jump_active
			then
				luasnip.unlink_current()
			end
		end

		vim.api.nvim_create_user_command("LeaveSnippet", leave_snippet, { nargs = "?" })
		vim.cmd("autocmd ModeChanged * LeaveSnippet")
	end,
}
