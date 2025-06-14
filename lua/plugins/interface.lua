return {
	-- Autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
	-- Clipboard - Copy/Paste
	{
		"EtiamNullam/deferred-clipboard.nvim",
		config = function()
			require("deferred-clipboard").setup({
				fallback = "unnamedplus", -- or your preferred setting for clipboard
			})
		end,
	},
	-- Comment
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	-- Flash
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
	},
	-- Neoscroll
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},
	-- Noice
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				long_message_to_split = true, -- long messages will be sent to a split
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
	},
	-- Notify
	{
		"rcarriga/nvim-notify",
		config = function()
			require("telescope").load_extension("notify")

			local config = require("notify")
			config.setup({
				timeout = 2000,
				render = "minimal",
			})
		end,
	},
	-- Smart Splits
	{
		"mrjones2014/smart-splits.nvim",

		config = function()
			require("smart-splits").setup()
		end,
	},
	-- Surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- Toggleterm
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VeryLazy",
		opts = {
			open_mapping = [[<C-t>]],
			direction = "float",
			float_opts = {
				border = "curved",
			},
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_mode = true,
			close_on_exit = true,
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)
		end,
	},
}
