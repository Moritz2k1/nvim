return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {

			-- Auxiliary parsers
			"bash",
			"diff",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",

			-- My parsers
			"c",
			"java",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"xml",
			"json",
			"sql",
		}

		require("nvim-treesitter").install(parsers)

		---@param buf integer
		---@param language string
		local function try_attach(buf, language)
			if not vim.treesitter.language.add(language) then
				return
			end
			vim.treesitter.start(buf, language)
			if vim.treesitter.query.get(language, "indents") then
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		end

		local available_parsers = require("nvim-treesitter").get_available()

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local buf, filetype = args.buf, args.match
				local language = vim.treesitter.language.get_lang(filetype)
				if not language then
					return
				end

				local installed_parsers = require("nvim-treesitter").get_installed("parsers")
				if vim.tbl_contains(installed_parsers, language) then
					try_attach(buf, language)
				elseif vim.tbl_contains(available_parsers, language) then
					require("nvim-treesitter").install(language):await(function()
						try_attach(buf, language)
					end)
				else
					try_attach(buf, language)
				end
			end,
		})
	end,
}
