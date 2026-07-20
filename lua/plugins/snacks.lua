return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- Deal with big files
		bigfile = { enabled = true },

		-- Delete buffers
		bufdelete = { enabled = true },

		-- Dashboard
		dashboard = { example = "doom" },

		-- File explorer
		explorer = { enabled = true },

		-- Github CLI integration
		gh = { enabled = true },

		-- Git utilities
		git = { enabled = true },

		-- Open current file, branch, etc. in browser
		gitbrowse = { enabled = true },

		-- Indent guides and scopes
		indent = { enabled = true },

		-- Better vim.ui.input
		input = { enabled = true },

		-- Lazygit integration
		lazygit = { enabled = true },

		-- Pretty vim.notify popups
		notifier = { enabled = true },

		-- Notify
		notify = { enabled = true },

		-- Picker
		picker = { enabled = true },

		-- Load file before plugins
		quickfile = { enabled = true },

		-- LSP-integrated file renaming
		rename = { enabled = true },

		-- Scope detection
		scope = { enabled = true },

		-- Smooth scrolling
		scroll = { enabled = true },

		-- Pretty status column
		statuscolumn = { enabled = true },

		-- Terminal
		terminal = { enabled = true, win = { style = "float" } },

		-- Create and manage floating windows or splits
		win = { enabled = true },

		-- Auto-show LSP references
		words = { enabled = true },
	},

	config = function(_, opts)
		require("snacks").setup(opts)

		-- Exclude Snacks.image from checkhealth
		require("snacks.image").meta.health = false

		-- Exclude Snacks.toggle from checkhealth
		require("snacks.toggle").meta.health = false
	end,
}
