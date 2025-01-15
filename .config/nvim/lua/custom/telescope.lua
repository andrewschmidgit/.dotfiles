require('telescope').setup {
	extensions = {
		fzf = {}
	}
}

pcall(require('telescope').load_extension, 'fzf')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>/f', builtin.find_files, { desc = 'find files' })
vim.keymap.set('n', '<leader>//', builtin.live_grep, { desc = 'live grep' })
vim.keymap.set('n', '<leader>/b', builtin.buffers, { desc = 'buffers' })
vim.keymap.set('n', '<leader>/h', builtin.help_tags, { desc = 'help tags' })

vim.keymap.set('n', '<leader>/g', builtin.git_files, { desc = 'git files' })
