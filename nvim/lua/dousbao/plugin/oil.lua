return function()
	local winopt = {
		border = "single",
		win_options = {
			winblend = 20,
		}
	}

	require("oil").setup({
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
		float = winopt,
		preview = winopt,
		progress = winopt,
	})
end
