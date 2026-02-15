-------------------------------------------------
-- neovim builtin lsp client setup
-------------------------------------------------
return function()
	local augroup = vim.api.nvim_create_augroup("UserLspClient", { clear = true })
	local autocmd = vim.api.nvim_create_autocmd
	local keymap = vim.keymap.set

	-- gloabl server settings
	autocmd("LspAttach", {
		pattern = "*",
		group = augroup,
		callback = function(env)
			local opt = {
				noremap = true,
				silent = true,
				buffer = env.buf
			}

			keymap("n", "<Leader>lr", vim.lsp.buf.references, opt)
			keymap("n", "<Leader>ld", vim.lsp.buf.definition, opt)
			keymap("n", "<Leader>lc", vim.lsp.buf.code_action, opt)
			keymap("n", "<Leader>ln", vim.lsp.buf.rename, opt)

			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end
	})

	-- rust
	autocmd("LspAttach", {
		pattern = "*.rs",
		group = augroup,
		callback = function(env)
			autocmd("BufWritePre", {
				buffer = env.buf,
				group = augroup,
				callback = function()
					vim.lsp.buf.format({ timeout_ms = 1000 })
				end,
			})
		end
	})
end
