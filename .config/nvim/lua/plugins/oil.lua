return {
	'stevearc/oil.nvim',
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	keys = {
		{ '-', '<cmd>Oil<enter>', mode = { 'n' }}
	},
	opts = {
		default_file_explorer = true
	}
}
