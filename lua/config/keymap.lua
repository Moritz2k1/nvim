local map = vim.keymap.set

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Disable sideways mouse scrolling
map("", "<ScrollWheelLeft>", "<Nop>")
map("", "<ScrollWheelRight>", "<Nop>")

-- Telescope
local telescope = require("telescope.builtin")
map("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Find by grep" })
map("n", "<leader>fb", telescope.buffers, { desc = "Find buffers" })
map("n", "<leader>fh", telescope.help_tags, { desc = "Find help" })
map("n", "<leader>fk", telescope.keymaps, { desc = "Find keymaps" })

-- Lazygit
map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
