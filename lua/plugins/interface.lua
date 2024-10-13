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
  -- Mini.ai
  {
    "echasnovski/mini.ai",
    version = false,
    config = function()
      require("mini.ai").setup()
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
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
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
}
