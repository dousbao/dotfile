return function()
	-- rust
	vim.lsp.enable("rust_analyzer")

	-- qml
	vim.lsp.config("qmlls", {
		cmd = { "qmlls6" }
	})
	vim.lsp.enable("qmlls")
end
