return function()
	require("dressing").setup({
		input = {
			enabled = true,
			border = "single",
		},
		select = {
			enabled = true,
			backend = { "builtin" },
			builtin = {
				border = "single",
			}
		}
	})
end
