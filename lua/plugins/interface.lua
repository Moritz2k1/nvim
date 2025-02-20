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
		config = function()

			local pywal16_core = require("pywal16.core")
			local colors = pywal16_core.get_colors()

			local function set_highlight(group, opts)
				vim.api.nvim_set_hl(0, group, opts)
			end

			set_highlight("NoiceCmdlinePopupBorder", { fg = colors.color1 })
			set_highlight("NoiceCmdlineIcon", { fg = colors.color1 })
			set_highlight("NoiceCmdlinePopup", { bg = colors.color0 })
			set_highlight("NoiceCmdline", { fg = colors.foreground, bg = colors.color0 })
			set_highlight("NoicePopupBorder", { fg = colors.color1 })
			set_highlight("NoicePopupmenu", { bg = colors.color0 })
			set_highlight("NoiceVirtualText", { fg = colors.color1 })

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

			local pywal16_core = require("pywal16.core")
			local colors = pywal16_core.get_colors()

			local function set_highlight(group, properties)
				vim.api.nvim_set_hl(0, group, properties)
			end

			local notify_highlights = {
				ERROR = { fg = colors.color1, bg = colors.background },
				WARN = { fg = colors.color3, bg = colors.background },
				INFO = { fg = colors.color3, bg = colors.background },
				DEBUG = { fg = colors.color4, bg = colors.background },
				TRACE = { fg = colors.color5, bg = colors.background },
			}

			for level, hl in pairs(notify_highlights) do
				set_highlight("Notify" .. level .. "Border", { fg = hl.fg })
				set_highlight("Notify" .. level .. "Icon", { fg = hl.fg })
				set_highlight("Notify" .. level .. "Title", { fg = hl.fg })
				set_highlight("Notify" .. level .. "Body", { fg = colors.foreground, bg = hl.bg })
			end

			require("notify").setup({
				background_colour = colors.background,
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
