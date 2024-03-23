return function()
	local leap = require("leap")

	vim.keymap.set("n", "s", "<Plug>(leap)")
	vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
	vim.keymap.set({"x", "o"}, "s", "<Plug>(leap-forward)")
	vim.keymap.set({"x", "o"}, "S", "<Plug>(leap-backward)")

	leap.opts.highlight_unlabeled_phase_one_targets = true
end
