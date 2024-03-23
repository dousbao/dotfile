local M = {}

M["tui"] = function()
	vim.o.mouse = ""
end

M["gui"] = function()
	vim.o.mouse = "a"
	vim.o.mousehide = true
	vim.o.mousemodel = "extend"
end

return vim.g.neovide and M.gui or M.tui
