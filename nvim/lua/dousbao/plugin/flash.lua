return function()
	require("flash").setup({
		-- labels = "abcdefghijklmnopqrstuvwxyz",
		labels = "asdfghjklqwertyuiopzxcvbnm",
		search = {
			trigger = '',		-- currently so hard to use
		},
		label = {
			style = "overlay",
			rainbow = {
				enabled = true,
				shade = 5,
			}
		},
		modes = {
			search = {
				highlight = { backdrop = true }
			},
			char = {
				enabled = false,
			},
		},
		prompt = {
			enabled = false,
		},
	})
end
