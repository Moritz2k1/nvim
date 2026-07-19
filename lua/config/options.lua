local opt = vim.opt

-- Disable providers that do not get used - skips health check
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Spaces instead of tabs
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2

-- Enable mouse mode
opt.mouse = 'a'

-- Let h/l and arrow keys move to the previous/next line at buffer edges
opt.whichwrap:append('<>[]hl')

-- Don't show mode, status line covers it
opt.showmode = false

-- Enable break indent, wrap at word boundaries
opt.breakindent = true
opt.linebreak = true

-- Persistent undo across sessions
opt.undofile = true

-- Disable swapfile
opt.swapfile = false

-- Case-insensitive search, unless capitals are used
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on to avoid text shifting
opt.signcolumn = 'yes'

-- One statusline for whole editor instead of one per split
opt.laststatus = 3

-- Keep the rest of the screen stable when opening/closing a split
opt.splitkeep = 'screen'

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
opt.timeoutlen = 300

-- New splits open right/below
opt.splitright = true
opt.splitbelow = true

-- Hide the ~ shown on empty lines past end of buffer
opt.fillchars = { eob = ' ' }

-- Live preview of :substitute
opt.inccommand = 'split'

-- Highlight current line
opt.cursorline = true

-- Lines to keep visible above/below cursor
opt.scrolloff = 10

-- True color support
opt.termguicolors = true

-- Sync clipboard between OS and Neovim
vim.schedule(function() opt.clipboard = 'unnamedplus' end)
