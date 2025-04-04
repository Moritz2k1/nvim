vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Set <space> as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable line/relative numbers by default
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable deprecated messages
vim.deprecate = function() end
