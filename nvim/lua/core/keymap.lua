-------------------------------------------------
-- neovim keymap settings
-------------------------------------------------
vim.g["mapleader"] = " "
vim.g["maplocalleader"] = " "

-- buffer
vim.keymap.set("n", "<S-Right>", vim.cmd.bnext, { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Left>", vim.cmd.bprev, { desc = "Go to previous buffer" })
vim.keymap.set("n", "<S-q>", vim.cmd.bdelete, { desc = "Delete current buffer" })

-- window
vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-S-Left>", "<C-w>H", { desc = "Move current window to left most" })
vim.keymap.set("n", "<C-S-Right>", "<C-w>L", { desc = "Move current window to right most" })
vim.keymap.set("n", "<C-S-Up>", "<C-w>K", { desc = "Move current window to top most" })
vim.keymap.set("n", "<C-S-Down>", "<C-w>J", { desc = "Move current window to bottom most" })
vim.keymap.set("n", "<C-q>", "<C-w>q", { desc = "Quit current window" })

-- text selection
vim.keymap.set("v", "<", "<gv", { desc = "Shift selected text to left" })
vim.keymap.set("v", ">", ">gv", { desc = "Shift selected text to right" })
vim.keymap.set("v", "<Tab>", "o", { desc = "Switch active corner" })

-- search
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch, { desc = "Quit highlight search" })

-- clipboard
vim.keymap.set("v", "<C-c>", "\"+y", { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<C-v>", "\"+p", { desc = "Paste from system clipboard" })

-- quickfix
vim.keymap.set("n", "q:", "<Nop>", { desc = "Disable Quickfix" })

-- diagnostic
vim.keymap.set("n", "<S-Down>", 
	function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Goto next diagnostic" })
vim.keymap.set("n", "<S-Up>",
	function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Goto previous diagnostic" })
