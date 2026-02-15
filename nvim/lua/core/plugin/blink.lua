return function()
	require("blink.cmp").setup({
		completion = {
			-- no default select/auto insert
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				}
			},

			-- better menu outlook
			menu = {
				winblend = vim.o.winblend,
				border = { "𜵊", "🮂", "𜶘", "𜶖", "𜷓", "▂", "𜶿", "𜵈" },
				scrollbar = false,

				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "kind_icon", "label", gap = 1 },
					},
				}
			},

			-- better than auto_insert
			ghost_text = {
				enabled = true,
			},
		},

		-- use my own keymap
		keymap = {
			preset = "none",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Enter>"] = { "accept", "fallback" },
			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		},

		-- builtin signature is ok
		signature = {
			enabled = true,
			trigger = {
				show_on_keyword = true,
				show_on_insert = true,
			},
			window = {
				show_documentation = false,
				border = { "𜵊", "🮂", "𜶘", "𜶖", "𜷓", "▂", "𜶿", "𜵈" },
				winblend = vim.o.winblend,
				treesitter_highlighting = true,
				show_documentation = false,
				winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder"
			}
		},

		-- default cmd's keymap sucks
		cmdline = {
			completion = { 
				list = { 
					selection = { 
						preselect = false,
						auto_insert = false 
					} 
				},
				menu = { 
					auto_show = true 
				} 
			},
			keymap = { 
				preset = "inherit",
				["<Tab>"] = { "show", "select_next" },
			},
		}
	})
end
