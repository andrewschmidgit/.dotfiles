return {
	'folke/tokyonight.nvim',
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require('tokyonight').setup({
			style = 'moon',
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = 'dark',
				floats = 'dark',
			},
			dim_inactive = true,
			lualine_bold = true,
		})
		vim.cmd.colorscheme 'tokyonight'
	end
}
