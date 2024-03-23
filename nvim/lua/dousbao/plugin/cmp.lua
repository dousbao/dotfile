return function()
	local cmp = require("cmp")
	local kind_icons = {
		Text = "",
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Field = "󰇽",
		Variable = "󰂡",
		Class = "󰠱",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "󰅲",
	}
	
	-- cmp global config
	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		enabled = function()
			-- disable completion in comments
			local context = require 'cmp.config.context'
			-- keep command mode completion enabled when cursor is in a comment
			if vim.api.nvim_get_mode().mode == 'c' then
				return true
			else
				return not context.in_treesitter_capture("comment") 
					and not context.in_syntax_group("Comment")
			end
		end,

		window = {
			completion = {
				border = "single",
				winhighlight = "NormalFloat:,FloatBorder:"
			},
			documentation = {
				border = "single",
				winhighlight = "NormalFloat:,FloatBorder:"
			}
		},

		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm(),
			["<Tab>"] = cmp.mapping.select_next_item(),
			["<S-Tab>"] = cmp.mapping.select_prev_item(),
			["<S-Up>"] = cmp.mapping.scroll_docs(-4),
			["<S-Down>"] = cmp.mapping.scroll_docs(4),
			["<Up>"] = cmp.mapping(function(fallback)
				vim.cmd [[call feedkeys("\<Up>", 'n')]]
			end),
			["<Down>"] = cmp.mapping(function(fallback)
				vim.cmd [[call feedkeys("\<Down>", 'n')]]
			end)
		}),

		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "rg", keyword_length = 3 },
		}),

		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = function(entry, vim_item)
				-- Kind icons
				vim_item.kind = kind_icons[vim_item.kind]
				-- Source
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					cmdline = "[CMD]",
					rg = "[GREP]",
				})[entry.source.name]
				return vim_item
			end
		},

		experimental = {
			ghost_text = false,
		},
	})

	-- cmp specific configs
	cmp.setup.filetype({ "TelescopePrompt" }, {
		enabled = false
	})

	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "cmdline" },
		})
	})

	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "rg" }
		})
	})
end
