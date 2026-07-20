return {
	"akinsho/toggleterm.nvim",
	opts = {
		direction = "float",
		float_opts = {
			width = function() return math.floor(vim.o.columns * 0.6) end,
			height = function() return math.floor(vim.o.lines * 0.6) end,
			border = "rounded",
		},
	},
}
