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

		-- Vue's language-tools needs TS6 API, tsgo (TS7) doesn't support it yet
		local function is_vue_project()
			local cwd = vim.fn.getcwd()
			local ok, lines = pcall(vim.fn.readfile, cwd .. "/package.json")
			if ok and lines and #lines > 0 then
				local ok2, decoded = pcall(vim.json.decode, table.concat(lines, "\n"))
				if ok2 and decoded then
					local deps = vim.tbl_extend("force", decoded.dependencies or {}, decoded.devDependencies or {})
					if deps["vue"] or deps["nuxt"] or deps["@vue/compiler-sfc"] then
						return true
					end
				end
			end
			return vim.fn.glob(cwd .. "/vue.config.*") ~= ""
		end

		if is_vue_project() then
			vim.lsp.config("vue_ls", {
				cmd = {
					"vue-language-server",
					"--stdio",
					"--tsdk=" .. vim.fn.trim(vim.fn.system("npm root -g")) .. "/typescript/lib",
				},
			})

			vim.lsp.config("vtsls", {
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
				settings = {
					vtsls = {
						tsserver = {
							globalPlugins = {
								{
									name = "@vue/typescript-plugin",
									location = vim.fn.trim(vim.fn.system("npm root -g")) .. "/@vue/typescript-plugin",
									languages = { "vue" },
									configNamespace = "typescript",
								},
							},
						},
					},
				},
			})

			vim.lsp.enable({ "vue_ls", "vtsls" })
		else
			vim.lsp.enable("tsgo")
		end

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
