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
