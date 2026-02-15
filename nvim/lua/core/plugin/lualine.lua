return function()
	require('lualine').setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = " ", right = " " },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
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
					max_length = function() return vim.o.columns end,
					filetype_names = {
						oil = "File System"
					},
					symbols = {
						modified = " ",      -- Text to show when the buffer is modified
						alternate_file = "", -- Text to show to identify the alternate file
						directory =  "",     -- Text to show when the buffer is a directory
					},
					use_mode_colors = true,
					buffers_color = {
						-- Same values as the general color option can be used here.
						active = 'lualine_a_normal',     -- Color for active buffer.
						inactive = 'lualine_c_normal', -- Color for inactive buffer.
					},
				}
			}
		},
		winbar = {},
		inactive_winbar = {},
		extensions = {}
	})
end
