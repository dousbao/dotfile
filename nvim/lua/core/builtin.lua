-------------------------------------------------
-- neovim builtin features setup
-------------------------------------------------
local builtin = {
	{ name = "treesitter", setup = require("core.builtin.treesitter") },
	{ name = "signal", setup = require("core.builtin.signal") },
	{ name = "lspclient", setup = require("core.builtin.lspclient") },
	{ name = "diagnostic", setup = require("core.builtin.diagnostic") },
	{ name = "colorscheme", setup = require("core.builtin.colorscheme") },
	{ name = "highligh", setup = require("core.builtin.highlight") }
}

for _, builtin in ipairs(builtin) do
	local ok, err = pcall(builtin.setup)
	if not ok then
		vim.notify("failed to setup " .. builtin.name, vim.log.levels.ERROR)
	end
end
