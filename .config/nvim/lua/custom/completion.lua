vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append "c"

vim.keymap.set({ 'i', 's' }, '<c-k>', function()
	return vim.snippet.active({ direction = 1 }) and vim.snippet.jump(1)
end)

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
	return vim.snippet.active({ direction = -1 }) and vim.snippet.jump(-1)
end, { silent = true })
