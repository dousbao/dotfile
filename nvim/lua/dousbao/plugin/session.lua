return function()
	require("auto-session").setup()
	require("session-lens").setup({
		theme = "ivy",
		theme_conf = { 
			border = true,
			borderchars = { "-", " ", " ", " ", " ", " ", " ", " " },
		},
		previewer = true,
	})
end
