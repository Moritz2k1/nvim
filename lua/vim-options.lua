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

-- Disable depracated messages
vim.deprecate = function() end

-- Providers
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
