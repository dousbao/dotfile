-------------------------------------------------
-- builtin signal handler
-------------------------------------------------
return function()
	local uv = vim.uv

	-- SIGUSR1 -> reload colorscheme
	uv.signal_start(uv.new_signal(), 'sigusr1', function(signum)
		vim.schedule(function()
			local reloads = {
				{ path = "core.builtin.colorscheme" },
				{ path = "core.builtin.diagnostic" },
				{ path = "core.builtin.highlight" }
			}

			for _, reload in ipairs(reloads) do
				package.loaded[reload.path] = nil
				local ok, err = pcall(require(reload.path))
				if not ok then
					vim.notify("failed to reload " .. reload.path, vim.log.levels.ERROR)
				end
			end
		end)
	end)
end

