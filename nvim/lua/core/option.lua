-------------------------------------------------
-- neovim option settings
-------------------------------------------------
local tui = {
	-- stay in center
	scrolloff = 999,
	-- highlight cursor line
	cursorline = true,
	-- report line number
	number = true,
	-- 2 space per tab
	tabstop = 2,
	shiftwidth = 2,
	-- wrap is fine
	wrap = true,
	-- more natural split
	splitbelow = true,
	splitright = true,
	-- update buffer on file modified
	autoread = true,
	-- no backup file
	backup = false,
	writebackup = false,
	swapfile = false,
	-- better colors
	termguicolors = true,
	-- smaller popup
	pumheight = 20,
	-- transparent popup/float
	pumblend = 20,
	winblend = 20,
	-- persistent undo
	undofile = true,
	undodir = vim.fn.stdpath("data") .. "/undo",
}

local gui = {}

-- apply tui
for opt, val in pairs(tui) do
	vim.o[opt] = val
end

-- apply gui
if vim.g.neovide then
	for opt, val in pairs(gui) do
		vim.o[opt] = val
	end
end
