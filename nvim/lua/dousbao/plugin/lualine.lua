return function()
	require("lualine").setup {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = { "NvimTree" },
				winbar = { "NvimTree" },
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			}
		},
		sections = {
			lualine_a = { "mode", "selectioncount", "searchcount" },
			lualine_b = { 
				{ "diagnostics", colored = false } 
			},
			lualine_c = { "branch", "filename" },
			lualine_x = { "encoding", "filesize", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" }
		},
		inactive_sections = {
			lualine_c = { "filename" },
			lualine_x = { "location" },
		},
		tabline = {
			lualine_a = { 
				{
					"buffers", 
					max_length = vim.o.columns,
					filetype_names = {
						oil = "File System"
					},
					symbols = {
						modified = " ",      -- Text to show when the buffer is modified
						alternate_file = "", -- Text to show to identify the alternate file
						directory =  "",     -- Text to show when the buffer is a directory
					}
				}
			}
		},
		winbar = {},
		inactive_winbar = {},
		extensions = {}
	}
end
