-------------------------------------------------
-- builtin diagnostic config
-------------------------------------------------
return function()
	vim.diagnostic.config({
		underline = true,
		virtual_text = false,
		virtual_lines = true,
		update_in_insert = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.HINT] = "",
				[vim.diagnostic.severity.INFO] = ""
			},
			numhl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticError",
				[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
				[vim.diagnostic.severity.HINT] = "DiagnosticHint",
				[vim.diagnostic.severity.INFO] = "DiagnosticInfo"
			}
		},
		virtual_lines = {
			current_line = true,
			format = function(diag)
				return diag.message
			end
		}
	})

	vim.cmd([[
		highlight link VirtualTextError ErrorFloat
		highlight link VirtualTextWarning WarningFloat
		highlight link VirtualTextInfo InfoFloat
		highlight link VirtualTextHint HintFloat
	]])
end

