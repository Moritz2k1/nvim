return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "jedi_language_server", "ruff_lsp"},
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- LSP for Lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- LSP for Python
      lspconfig.jedi_language_server.setup({
        capabilities = capabilities,
      })

      lspconfig.ruff_lsp.setup({
        capabilities = capabilities,
      })
    end,
  },
}
