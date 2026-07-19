return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'saghen/blink.cmp',
  },

  config = function()
    -- Merge blink.cmp extra capabilities into every server
    vim.lsp.config('*', {
      capabilities = require('blink.cmp').get_lsp_capabilities(),
    })

  -- Overrides
  vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
        },
      },
    })

  local servers = {
      'lua_ls',
      'clangd',
      'jdtls',
      'omnisharp',
      'html',
      'cssls',
      'ts_ls',
      'marksman',
      'lemminx',
      'jsonls',
    }

  vim.lsp.enable(servers)
  end
}
