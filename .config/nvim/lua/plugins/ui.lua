return {
	{ 'stevearc/dressing.nvim', opts = {} },

	-- indent guides
	{ 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

	-- status line
	{
		'nvim-lualine/lualine.nvim',
		event = 'VeryLazy',
		opts = {
			icons_enabled = true,
			theme = 'catppuccin',
		}
	}
}
