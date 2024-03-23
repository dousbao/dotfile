------------------------------------
-- neovim/neovide builtin options settings
------------------------------------
local tui = {
	-- stay in center
	scrolloff = 999,
	-- no bell
	belloff = "all",
	-- highlight cursor line
	cursorline = true,
	-- report line number
	number = true,
	-- easier jump
	relativenumber = true,
	-- 4 space per tab
	tabstop = 4,
	shiftwidth = 4,
	-- no wrap
	wrap = false,
	-- enable 24-bit RGB color
	termguicolors = true,
	-- smaller popup
	pumheight = 20,
	-- transparent popup/float
	pumblend = 20,
	winblend = 20,
	-- better session opts
	sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
}

local gui = {
	-- font
	guifont = "Hack Nerd Font:h15",
}

for key, val in pairs(tui) do
	vim.o[key] = val
end

if vim.g.neovide then
	for key, val in pairs(gui) do
		vim.o[key] = val
	end
end
