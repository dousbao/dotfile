return function()
	require("telescope").setup({
		-- global config
		defaults = {
			-- ignore meta files
			file_ignore_patterns = {
				"^.git/",
				"^target/",
			},

			-- better icon
			prompt_prefix = "   ",
			selection_caret = " ",
			multi_icon = " ",

			-- best telescope layout ever
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 0.6,
				prompt_position = "bottom",
				cursor = {
					width = 10,
				}
			},
			border = true,
			borderchars = { "-", " ", " ", " ", " ", " ", " ", " " },
			winblend = 30,

			-- more friendly keymap
			mappings = {
				i = {
					["<Esc>"] = "close",
				},
			},
		},

		-- specific config
		pickers = {},

		-- extensions
		extensions = {}
	})
end

