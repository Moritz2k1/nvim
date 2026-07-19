return {
	{
		"nvim-mini/mini.icons",
		version = false,
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
}
