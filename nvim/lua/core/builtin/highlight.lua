-------------------------------------------------
-- overwrite builtin highlighs
-------------------------------------------------
return function()
	vim.cmd([[
		highlight! NormalFloat ctermbg=NONE guibg=NONE
		highlight! FloatBorder ctermbg=NONE guibg=NONE
		highlight! FloatTitle ctermbg=NONE guibg=NONE
		highlight! LineNr ctermbg=NONE guibg=NONE
		highlight! SignColumn ctermbg=NONE guibg=NONE
	]])
end

