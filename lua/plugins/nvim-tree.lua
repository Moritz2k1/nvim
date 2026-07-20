return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup()

		local function open_nvim_tree(data)
			-- Only auto-open when a file was passed to nvim
			local real_file = vim.fn.filereadable(data.file) == 1
			if not real_file then
				return
			end
			require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
		end

		vim.api.nvim_create_autocmd("VimEnter", { callback = open_nvim_tree })
	end,
}
