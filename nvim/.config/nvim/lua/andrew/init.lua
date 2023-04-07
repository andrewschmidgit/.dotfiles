require("andrew.packer")
require("andrew.remap")
require("andrew.set")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.cmd.source(vim.fn.stdpath('config') .. '/vimrc.vim')
