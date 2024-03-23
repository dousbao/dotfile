return function()
	vim.cmd([[
		highlight! NormalFloat ctermbg=NONE guibg=NONE
		highlight! FloatBorder ctermbg=NONE guibg=NONE
		highlight! FloatTitle ctermbg=NONE guibg=NONE
		highlight! CursorLineNr ctermfg=142 guifg=#a9b665 cterm=bold gui=bold
	]])
end
