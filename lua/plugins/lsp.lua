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

  vim.lsp.config('clangd', {
       filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    })

  vim.lsp.config('lemminx', {
      filetypes = { 'xml', 'xsd', 'xslt', 'svg' },
    })

    vim.lsp.config('marksman', {
      filetypes = { 'markdown' },
    })

  local servers = {
      'lua_ls',
      'clangd',
      'jdtls',
      'html',
      'cssls',
      'ts_ls',
      'marksman',
      'jsonls',
    }

  vim.lsp.enable(servers)
  end
}
