-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

----------------------------------------------

-- Setup vim options
require("vim-options")

-- Setup plugins
require("lazy").setup("plugins", {
	rocks = {
		enabled = false, -- disable luarocks
		hererocks = false, -- disable hererocks
	},
})

-- Setup keymaps
require("keymaps")
