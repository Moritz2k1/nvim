-- lua/plugins/lualine.lua
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-mini/mini.icons" },
	event = "VeryLazy",
	config = function()
		require("mini.icons").mock_nvim_web_devicons()
		require("lualine").setup({})
	end,
}
