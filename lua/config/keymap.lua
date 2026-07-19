local map = vim.keymap.set

-- Clear search highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable sideways mouse scrolling
map('', '<ScrollWheelLeft>', '<Nop>')
map('', '<ScrollWheelRight>', '<Nop>')


local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Find by grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Find help' })
vim.keymap.set('n', '<leader>fk', telescope.keymaps, { desc = 'Find keymaps' })
