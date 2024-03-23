------------------------------------
-- builtin module management 
------------------------------------
local builtin = {
	diagnostic = require("dousbao.builtin.diagnostic"),
	mouse = require("dousbao.builtin.mouse"),
	lspclient = require("dousbao.builtin.lspclient"),
	terminal = require("dousbao.builtin.terminal"),
	highlight = require("dousbao.builtin.highlight")
}

for name, setup in pairs(builtin) do
	local ok, err = pcall(setup)
	if not ok then
		vim.notify("failed to setup " .. name, vim.log.levels.ERROR)
	end
end
