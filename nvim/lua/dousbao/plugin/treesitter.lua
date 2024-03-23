return function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
		autopairs = {
			enable = true,
		},
		indent = {
			enable = true,
		}
	})
end
