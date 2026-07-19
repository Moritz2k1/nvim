local map = vim.keymap.set

-- Clear search highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable sideways mouse scrolling
map('', '<ScrollWheelLeft>', '<Nop>')
map('', '<ScrollWheelRight>', '<Nop>')
