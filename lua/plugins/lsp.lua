return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
	},

	config = function()
		-- Merge blink.cmp extra capabilities into every server
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		-- Diagnostics
		vim.diagnostic.config({
			virtual_text = true,
			severity_sort = true,
		})

		-- Keep treesitter colors, otherwise LSP semantic tokens change them
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client then
					client.server_capabilities.semanticTokensProvider = nil
				end
			end,
		})

		-- Overrides
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim", "Snacks" } },
				},
			},
		})

		vim.lsp.config("clangd", {
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
		})

		vim.lsp.config("lemminx", {
			filetypes = { "xml", "xsd", "xslt", "svg" },
		})

		vim.lsp.config("marksman", {
			filetypes = { "markdown" },
		})

		local servers = {
			"lua_ls",
			"clangd",
			"html",
			"cssls",
			"marksman",
			"jsonls",
		}

		vim.lsp.enable(servers)
	end,
}
