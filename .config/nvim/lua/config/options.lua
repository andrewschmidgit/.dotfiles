local opt = vim.opt

-- shows preview of substitute command
opt.inccommand = 'split'

opt.smartcase = true
opt.ignorecase = true

opt.number = true
opt.relativenumber = true

opt.signcolumn = 'yes'
opt.showmode = false

opt.shiftwidth = 4
opt.tabstop = 4

opt.splitright = true
opt.splitbelow = true

opt.clipboard = "unnamedplus"

opt.swapfile = false

-- don't continue comments with 'o'
opt.formatoptions:remove "o"

opt.termguicolors = true

-- undo history after nvim restart
opt.undofile = true
