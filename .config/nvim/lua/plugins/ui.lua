return {
	{
		'stevearc/dressing.nvim',
		init = function()
			vim.ui.select = function(...)
				require('lazy').load({ plugins = { 'dressing.nvim' } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require('lazy').load({ plugins = { 'dressing.nvim' } })
				return vim.ui.input(...)
			end
		end,
		opts = {}
	},

	-- indent guides
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {
			scope = {
				enabled = true,
				show_exact_scope = true,
			}
		}
	},

	-- status line
	{
		'nvim-lualine/lualine.nvim',
		event = 'VeryLazy',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		opts = {
			icons_enabled = true,
		}
	},

	{
		'OXY2DEV/markview.nvim',
		-- lazy = false,
		ft = 'markdown',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		}
	}
}
