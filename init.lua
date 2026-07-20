-- Reduce startup time
vim.loader.enable()

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load lazy.nvim
require("config.lazy")
