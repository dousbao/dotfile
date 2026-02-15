return function()
	require("noice").setup({
		-- replace command line
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			opts = {
				position = {
					row = "20%",
					col = "50%"
				},
				size = {
					height = 1,
					width = "50%",
				},
				relative = "editor",
				border = {
					style = { "𜵊", "🮂", "𜶘", "𜶖", "𜷓", "▂", "𜶿", "𜵈" },
					text = {
						top = "",
					},
				},
				win_options = {
					winhighlight = "Normal:Pmenu"
				},
			}
		},

		-- replace message
		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},

		-- disable popup menu
		popupmenu = {
			enabled = false
		},

		-- disable LSP
		lsp = {
			progress = { enabled = false },
			hover = { enabled = false },
			signature = { enabled = false },
			message = { enabled = false }
		}
	})
end
