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

    vim.lsp.config("roslyn", {
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
        },
      },
    })

  local servers = {
      'lua_ls',
      'clangd',
      'jdtls',
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
