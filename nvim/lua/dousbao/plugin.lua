------------------------------------
-- plugin management (lazy.nvim)
------------------------------------
-- ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- double check installation
local ok, lazy = pcall(require, "lazy")
if not ok then
	vim.api.nvim_err_writeln("missing plugin: lazy.nvim not found")
	return
end

lazy.setup({
	-- colorscheme
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvbox-material")
		end
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ':TSUpdate',
		config = require("dousbao.plugin.treesitter")
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.5",
		dependencies = { 
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<Leader>tt", ":Telescope<CR>", silent = true },
			{ "<Leader>tf", ":Telescope find_files<CR>", silent = true },
			{ "<Leader>to", ":Telescope oldfiles<CR>", silent = true },
			{ "<Leader>tg", ":Telescope live_grep<CR>", silent = true },
		},
		config = require("dousbao.plugin.telescope"),
	},

	-- buffer/status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("dousbao.plugin.lualine")
	},

	-- indent line
	{
		"lukas-reineke/indent-blankline.nvim",
		config = require("dousbao.plugin.indent")
	},

	-- auto pair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- comment
	{
		"terrortylor/nvim-comment",
		keys = {
			{ "<Leader>c", ":CommentToggle<CR>", mode = { "n", "v" }, silent = true }
		},
		config = require("dousbao.plugin.comment")
	},

	-- snippet engine
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		build = "make install_jsregexp"
	},

	-- completion engine with sources
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"lukas-reineke/cmp-rg",
		},
		config = require("dousbao.plugin.cmp")
	},

	-- session manager
	{
		"rmagatti/auto-session",
		dependencies = { "rmagatti/session-lens" },
		keys = {
			{ "<Leader>sw", ":SessionSave<CR>", silent = true },
			{ "<Leader>ss", ":SearchSession<CR>", silent = true },
			{ "<Leader>sd", ":SessionDelete<CR>", silent = true },
		},
		lazy = false,
		config = require("dousbao.plugin.session"),
	},

	-- git
	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},

	-- file manager
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<Leader>f", ":Oil<CR>", silent = true }
		},
		lazy = false,
		config = require("dousbao.plugin.oil")
	},

	-- context
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = true,
	},

	-- notification
	{
		"j-hui/fidget.nvim",
		lazy = false,
		config = require("dousbao.plugin.fidget"),
	},

	-- input/select ui
	{
		"stevearc/dressing.nvim",
		config = require("dousbao.plugin.dressing")
	},

	-- motion
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end },
		},
		config = require("dousbao.plugin.flash")
	},

	-- LSP
	-- installer
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = true,
	},
	-- configer
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		dependencies = { 
			"williamboman/mason.nvim", 
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp"
		},
		config = require("dousbao.plugin.lspserver")
	}
})
