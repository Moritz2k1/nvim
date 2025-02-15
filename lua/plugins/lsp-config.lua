return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {

					-- LSPs
					"lua_ls",
					"jedi_language_server",
					"ruff",
					"asm_lsp",
					"clangd",

					-- Formatters and Linters
					"stylua",
					"clang-format",

					-- Debuggers
					"debugpy",
					"codelldb",
				},
				auto_update = true,
				run_on_start = true,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({})
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

			lspconfig.ruff.setup({
				capabilities = capabilities,
			})

			-- LSP for Assembly
			lspconfig.asm_lsp.setup({
				capabilities = capabilities,
			})

			-- LSP for C/C++
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
		end,
	},
}
