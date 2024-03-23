return function()
	local mason_lspconfig = require("mason-lspconfig")
	local lspconfig = require("lspconfig")

	-- cmp has more capabilities than default lsp client
	local capabilities
	local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if ok then
		capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
	else
		capabilities = vim.lsp.protocol.make_client_capabilities()
	end

	-- server setup
	mason_lspconfig.setup({})
	mason_lspconfig.setup_handlers({
		-- default handler
		function(server)
			lspconfig[server].setup({
				capabilities = capabilities,
			})
		end,

		-- rust
		["rust_analyzer"] = function()
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					vim.lsp.inlay_hint.enable(bufnr)
				end,
				settings = {
					["rust-analyzer"] = {
						cargo = {
							features = "all"
						},
						rustfmt = {
							extraArgs = { "--config", "tab_spaces=4" },
						},
					},
				}
			})
		end,
	})
end
