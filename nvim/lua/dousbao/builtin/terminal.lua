return function()
	local augroup = vim.api.nvim_create_augroup("UserTerminal", { clear = true })
	local autocmd = vim.api.nvim_create_autocmd
	local keymap = vim.api.nvim_buf_set_keymap
	local opt = {
		noremap = true,
		silent = true,
	}

	-- simple single terminal manager
	local termbuf = nil
	local termwin = nil
	vim.keymap.set({ "n", "t" }, "<C-\\>", function() 
		local height = math.floor(vim.o.lines * 0.3)

		if termbuf == nil or not vim.api.nvim_buf_is_loaded(termbuf) then
			local oldbuf = vim.api.nvim_get_current_buf()
			vim.cmd("terminal")
			termbuf = vim.api.nvim_get_current_buf()
			vim.api.nvim_win_set_buf(0, oldbuf)
			vim.bo[termbuf].buflisted = false
		end

		if termwin == nil or not vim.api.nvim_win_is_valid(termwin) then
			vim.cmd("belowright split")
			vim.cmd("wincmd J")

			termwin = vim.api.nvim_get_current_win()
			vim.api.nvim_win_set_height(termwin, height)
			vim.api.nvim_win_set_buf(termwin, termbuf)
		else
			vim.api.nvim_win_hide(termwin)
			termwin = nil
		end
	end, opt)

	-- terminal buffer local keymaps
	autocmd("TermOpen", {
		pattern = "*",
		group = augroup,
		callback = function(env)
			vim.cmd("setlocal nonumber norelativenumber")

			keymap(env.buf, "t", "<ESC>", "<C-\\><C-n>", opt)
			keymap(env.buf, "t", "<S-Right>", "<C-\\><C-n>:bnext<CR>", opt)
			keymap(env.buf, "t", "<S-Left>", "<C-\\><C-n>:bprevious<CR>", opt)
			keymap(env.buf, "t", "<S-q>", "<C-\\><C-n>:bd!<CR>", opt)
			keymap(env.buf, "t", "<C-Up>", "<C-\\><C-n>:wincmd k<CR>", opt)
			keymap(env.buf, "t", "<C-Left>", "<C-\\><C-n>:wincmd h<CR>", opt)
			keymap(env.buf, "t", "<C-Right>", "<C-\\><C-n>:wincmd l<CR>", opt)
			keymap(env.buf, "t", "<C-Down>", "<C-\\><C-n>:wincmd j<CR>", opt)

			vim.cmd("startinsert")
		end
	})

	-- auto insert
	autocmd("BufEnter", {
		pattern = "term://*",
		group = augroup,
		command = "startinsert"
	})
end
