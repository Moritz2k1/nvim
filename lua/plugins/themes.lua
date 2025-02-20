return {
	-- Get Theme from Pywal16
	{
		"uZer/pywal16.nvim",
		lazy = false, -- Load the colorscheme immediately
		priority = 1000, -- Ensure it loads first
		config = function()
			vim.cmd.colorscheme("pywal16")
		end,
	},
	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = { theme = "pywal16-nvim" },
			})
		end,
	},
	-- Dashboard
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("alpha").setup(require("alpha.themes.theta").config)
		end,
	},
}
