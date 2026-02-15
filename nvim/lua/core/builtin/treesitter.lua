-------------------------------------------------
-- neovim treesitter setup
-------------------------------------------------
return function()
	local enabled = {
		"rust", "c", "cpp", "lua", "markdown", "fish"
	}

	vim.api.nvim_create_autocmd("FileType", {
		pattern = enabled,
		callback = function() 
			vim.treesitter.start() 
		end
	})
end
