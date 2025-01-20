return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		settings = {
			save_on_toggle = true,
			sync_on_ui_close = true,
		}
	},
	keys = {
		{ '<leader>a', function() require('harpoon'):list():add() end,                                mode = 'n', desc = 'Add to jump list' },
		{ '<C-e>',     function()
			local h = require('harpoon'); h.ui:toggle_quick_menu(h:list())
		end,                                                                                          mode = 'n', desc = 'Add to jump list' },
		{ '<C-h>',     function() require('harpoon'):list():select(1) end,                            mode = 'n', },
		{ '<C-t>',     function() require('harpoon'):list():select(2) end,                            mode = 'n', },
		{ '<C-n>',     function() require('harpoon'):list():select(3) end,                            mode = 'n', },
		{ '<C-s>',     function() require('harpoon'):list():select(4) end,                            mode = 'n', },
	},
}
