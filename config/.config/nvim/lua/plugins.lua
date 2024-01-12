require('lazy').setup({
	'tpope/vim-sleuth',
	'folke/which-key.nvim',
	'numToStr/Comment.nvim',
	-- Display function signature automagically
	{
		'ray-x/lsp_signature.nvim',
		event = 'VeryLazy',
		opts = {},
		config = function(_, opts) require('lsp_signature').setup(opts) end
	},
	{ 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
	{ import = 'custom.plugins' },
})
