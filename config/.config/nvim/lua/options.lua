-- Enable Line numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.scrolloff = 8

-- Enable mouse
vim.o.mouse = 'a'

-- Sync clipboard
vim.o.clipboard = 'unnamedplus'

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching unless capital letter
vim.o.ignorecase = true
vim.o.smartcase = true

-- Break indent
vim.o.breakindent = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true
