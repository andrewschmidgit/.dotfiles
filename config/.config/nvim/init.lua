vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.tabstop = 4
vim.o.shiftwidth = 4

require 'install-lazy'
require 'plugins'
require 'options'
require 'keymaps'
require 'telescope-setup'
require 'treesitter-setup'
require 'lsp-setup'
require 'cmp-setup'
