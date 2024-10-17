--------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Which key
local wk = require("which-key")

-- Neovim shortcuts
-----------------------------------------------------------

-- Disable highlighting
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Move around splits using Ctrl + {h,j,k,l}
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Oil
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
keymap("n", "<C-->", function()
	vim.cmd("vsplit | wincmd l")
	require("oil").open()
end)

--Telescope
local builtin = require("telescope.builtin")
-- Setup which-key
wk.add({
	{ "<leader>f", group = "Telescope" },
	{ "<leader>ff", builtin.find_files, desc = "Find files" },
	{ "<leader>fg", builtin.live_grep, desc = "Live grep" },
	{ "<leader>fr", builtin.oldfiles, desc = "Recent files" },
	{ "<leader>fb", builtin.buffers, desc = "Search buffers" },
	{ "<leader>fk", builtin.keymaps, desc = "Keymappings" },
	{ "<leader>fq", builtin.quickfix, desc = "Quickfix list" },
	{ "<leader>fu", "<Cmd>Telescope undo<CR>", desc = "Undotree" },
})

-- Buffers
-- Move to previous/next
keymap("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
keymap("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
keymap("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
keymap("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
keymap("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
keymap("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
keymap("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
keymap("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
keymap("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
keymap("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
keymap("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
keymap("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
keymap("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
keymap("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
keymap("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
keymap("n", "<A-d>", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", opts)

-- Windows
local smart_splits = require("smart-splits")
wk.add({
	{ "<leader>w", group = "Windows" },
	{ "<leader>wq", ":close<CR>", desc = "Close window" },
	{ "<leader>we", ":vsplit<CR>", desc = "Split vertically" },
	{ "<leader>wd", ":split<CR>", desc = "Split horizontally" },
	{ "<leader>wh", smart_splits.swap_buf_left, desc = "Swap left" },
	{ "<leader>wj", smart_splits.swap_buf_down, desc = "Swap down" },
	{ "<leader>wk", smart_splits.swap_buf_up, desc = "Swap up" },
	{ "<leader>wl", smart_splits.swap_buf_right, desc = "Swap right" },
})

-- Tmux Navigator
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
keymap("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>")

-- Resize window
keymap("n", "<A-h>", require("smart-splits").resize_left)
keymap("n", "<A-j>", require("smart-splits").resize_down)
keymap("n", "<A-k>", require("smart-splits").resize_up)
keymap("n", "<A-l>", require("smart-splits").resize_right)

-- LSP
local lspbuf = require("vim.lsp.buf")
keymap("n", "K", lspbuf.hover)
-- Setup which-key
wk.add({
	{ "<leader>g", group = "LSP" },
	{ "<leader>gd", lspbuf.definition, desc = "Definition" },
	{ "<leader>gr", lspbuf.references, desc = "References" },
	{ "<leader>gc", lspbuf.code_action, desc = "Code action" },
	{ "<leader>gf", lspbuf.format, desc = "Format" },
	{ "<leader>gn", lspbuf.rename, desc = "Rename" },
})

-- Debugger
keymap("n", "<F5>", function()
	require("dap").continue()
end)
keymap("n", "<F12>", function()
	require("dap").step_over()
end)
keymap("n", "<F11>", function()
	require("dap").step_into()
end)
keymap("n", "<F12>", function()
	require("dap").step_out()
end)
keymap("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })

-- Compiler
keymap("n", "<F6>", ":wa <cmd>CompilerOpen<cr>", { noremap = true, silent = true }) -- Open compiler
-- Redo last selected option
keymap(
	"n",
	"<F8>",
	"<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
		.. "<cmd>CompilerRedo<cr>",
	{ noremap = true, silent = true }
)
-- Toggle compiler results
keymap("n", "<F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

-- Aerial
-- Jump forwards/backwards with '{' and '}'
keymap("n", "{", "<cmd>AerialPrev<CR>")
keymap("n", "}", "<cmd>AerialNext<CR>")
keymap("n", "<leader>a", "<cmd>AerialToggle<CR>")

-- Flash
keymap({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })

keymap({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })

keymap({ "o" }, "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })

keymap({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

-- Lazygit
wk.add({
	{ "<leader>l", group = "LazyGit" },
	{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
})
