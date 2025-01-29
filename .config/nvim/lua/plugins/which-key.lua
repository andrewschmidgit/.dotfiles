return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	keys = {
		{
			'<leader>?',
			function() require('which-key').show({ global = false }) end,
			desc = 'Buffer local keymaps'
		}
	},
	config = function()
		local wk = require('which-key')
		wk.add {
			{ '<leader>d', group = 'diagnostics' },
			{ '<leader>/', group = 'find' },
			{ '<leader>g', group = 'git' },
		}
	end
}
