return {
	'folke/which-key.nvim',
	config = function()
		local wk = require('which-key')
		wk.add {
			{ '<leader>d', group = 'diagnostics' },
			{ '<leader>/', group = 'find' },
			{ '<leader>g', group = 'git' },
		}
	end
}
