return function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" }
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text })
	end

	vim.diagnostic.config({
		underline = true,
		virtual_text = {
			source = false,
			prefix = "",
		},
		signs = true,
		update_in_insert = true,
		severity_sort = true,
	})

	vim.cmd([[
		highlight link VirtualTextError ErrorFloat
		highlight link VirtualTextWarning WarningFloat
		highlight link VirtualTextInfo InfoFloat
		highlight link VirtualTextHint HintFloat
	]])

	local keymap = vim.api.nvim_set_keymap
	local opt = {
		noremap = true,
		silent = true,
	}

	keymap("n", "<Leader>d", ":lua vim.diagnostic.goto_next({ float = false })<CR>", opt)
	keymap("n", "<Leader>D", ":lua vim.diagnostic.goto_prev({ float = false })<CR>", opt)
end
