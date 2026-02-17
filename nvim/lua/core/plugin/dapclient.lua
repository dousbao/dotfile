return function()
	local dap = require("dap")

	-- signs
	vim.fn.sign_define("DapBreakpoint", {text="", texthl="Debug", linehl="", numhl=""})
	vim.fn.sign_define("DapStopped", {text="", texthl="Special", linehl="PmenuSel", numhl=""})

	-- adapters
	dap.adapters.codelldb = {
		type = "executable",
		command = "codelldb"
	}

	-- configuration
	dap.configurations.rust = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		}
	}
end
