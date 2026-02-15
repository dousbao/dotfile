return function()
	require("oil").setup({
		default_file_explorer = true,
		columns = {
			"icon",
		},
		view_options = {
			show_hidden = true,
		},
		win_options = {
			relativenumber = false,
			number = false
		},
		confirmation = {
			border = "single",
			win_options = {
				winblend = vim.o.winblend
			}
		}
	})
end
