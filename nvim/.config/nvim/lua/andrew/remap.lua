vim.g.mapleader = " "

-- Project View
vim.keymap.set("n", "<leader>pv", function() vim.cmd("Ex") end)

-- In visual mode, use J and K to move lines up and down
--vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Leaves cursor where it was before joining the line below
--vim.keymap.set("n", "J", "mzJ`z")

-- Recenters the cursor when navigating up and down
--vim.keymap.set("n", "<C-d>", "<C-d>zz")
--vim.keymap.set("n", "<C-u>", "<C-u>zz")
--vim.keymap.set("n", "n", "nzzzv")
--vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")
