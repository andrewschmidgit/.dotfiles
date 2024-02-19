vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- make tabs appear as 4 spaces
vim.o.tabstop = 4

-- use a tab character when indenting
vim.o.shiftwidth = 4

-- enable line numbers
vim.wo.number = true

-- enable relative line numbers
vim.wo.relativenumber = true

-- try to have 8 rows of offset
vim.opt.scrolloff = 8

-- enable mouse
vim.o.mouse = "a"

-- sync clipboard
vim.o.clipboard = "unnamedplus"

-- save undo history
vim.o.undofile = true

-- better case-sensitivity
vim.o.ignorecase = true
vim.o.smartcase = true

-- break indent
vim.o.breakindent = true

-- keep signcolumn on
vim.wo.signcolumn = "yes"

-- decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- make completeopt better
vim.o.completeopt = "menuone,noselect"

vim.o.termguicolors = true
