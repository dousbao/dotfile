------------------------------------
-- neovim/neovide editor variable settings
------------------------------------
local tui = {
	-- map leader
	mapleader = ' ',
}

local gui = {
	-- nerd font is awesome
	guifont = "Hack Nerd Font:h15",
	-- no blurred floating window
	neovide_floating_blur_amount_x = 0,
	neovide_floating_blur_amount_y = 0,
	-- border padding
	neovide_padding_top = 0,
	neovide_padding_bottom = 0,
	neovide_padding_right = 0,
	neovide_padding_left = 0,
	-- no transparency background
	neovide_transparency = 1,
	-- no shadow for floating window
	neovide_floating_shadow = false,
	-- hide mouse when typing
	neovide_hide_mouse_when_typing = true,
	-- confirm quit is annoying
	neovide_confirm_quit = false,
	-- no animation when swith to command
	neovide_cursor_animate_command_line = false,
	-- cursor particle
	neovide_cursor_vfx_mode = "wireframe",
	-- faster animation
	neovide_scroll_animation_length = 0.05,
	neovide_cursor_animation_length = 0.02
}

for key, val in pairs(tui) do
	vim.g[key] = val
end

if vim.g.neovide then
	for key, val in pairs(gui) do
		vim.g[key] = val
	end
end
