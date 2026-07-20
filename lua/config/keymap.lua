local map = vim.keymap.set

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Disable sideways mouse scrolling
map("", "<ScrollWheelLeft>", "<Nop>")
map("", "<ScrollWheelRight>", "<Nop>")

-- Move splits
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })

-- Telescope
local telescope = require("telescope.builtin")
map("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Find by grep" })
map("n", "<leader>fb", telescope.buffers, { desc = "Find buffers" })
map("n", "<leader>fh", telescope.help_tags, { desc = "Find help" })
map("n", "<leader>fk", telescope.keymaps, { desc = "Find keymaps" })

-- Lazygit
map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

-- Nvim-Tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Nvim-Tree" })
