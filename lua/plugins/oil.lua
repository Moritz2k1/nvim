return {
	{ --Oil
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			require("oil").setup({
				default_file_explorer = true,
        keymaps = {
          ["q"] = "actions.close", -- Close oil
        }
			})
		end,
	},
}
