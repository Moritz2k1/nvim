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

		-- Adjust highlighting
		config = function()
			-- Visual mode
			Set_highlight("Visual", { fg = Colors.background, bg = Colors.color1 })

			-- Searching
			Set_highlight("IncSearch", { fg = Colors.background, bg = Colors.color1 })
			Set_highlight("Search", { fg = Colors.background, bg = Colors.color3 })

			-- Flash highlighting
			Set_highlight("FlashLabel", { fg = Colors.background, bg = Colors.color3, bold = true })
			Set_highlight("FlashMatch", { fg = Colors.background, bg = Colors.color2 })
			Set_highlight("FlashCurrent", { fg = Colors.background, bg = Colors.color1, bold = true })
		end,
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
		config = function()
			Set_highlight("NoiceCmdlinePopupBorder", { fg = Colors.color1 })
			Set_highlight("NoiceCmdlineIcon", { fg = Colors.color1 })
			Set_highlight("NoiceCmdlinePopup", { bg = Colors.color0 })
			Set_highlight("NoiceCmdline", { fg = Colors.foreground, bg = Colors.color0 })
			Set_highlight("NoicePopupBorder", { fg = Colors.color1 })
			Set_highlight("NoicePopupmenu", { bg = Colors.color0 })
			Set_highlight("NoiceVirtualText", { fg = Colors.color1 })

			require("noice").setup({
				views = {
					cmdline_popup = {
						border = {
							style = "rounded",
							highlight = "NoiceCmdlinePopupBorder",
						},
						win_options = {
							winblend = 10,
							winhighlight = {
								Normal = "NoiceCmdlinePopup",
								FloatBorder = "NoiceCmdlinePopupBorder",
							},
						},
					},
					popupmenu = {
						border = {
							style = "rounded",
							highlight = "NoicePopupBorder",
						},
						win_options = {
							winblend = 10,
							winhighlight = {
								Normal = "NoicePopupmenu",
								FloatBorder = "NoicePopupBorder",
							},
						},
					},
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	-- Notify
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify_highlights = {
				ERROR = { fg = Colors.color1, bg = Colors.background },
				WARN = { fg = Colors.color3, bg = Colors.background },
				INFO = { fg = Colors.color3, bg = Colors.background },
				DEBUG = { fg = Colors.color4, bg = Colors.background },
				TRACE = { fg = Colors.color5, bg = Colors.background },
			}

			for level, hl in pairs(notify_highlights) do
				Set_highlight("Notify" .. level .. "Border", { fg = hl.fg })
				Set_highlight("Notify" .. level .. "Icon", { fg = hl.fg })
				Set_highlight("Notify" .. level .. "Title", { fg = hl.fg })
				Set_highlight("Notify" .. level .. "Body", { fg = Colors.foreground, bg = hl.bg })
			end

			require("notify").setup({
				background_colour = Colors.background,
				timeout = 2000,
				render = "minimal",
			})

			require("telescope").load_extension("notify")
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
	-- Tmux Navigator
	{
		"christoomey/vim-tmux-navigator",
	},
}
