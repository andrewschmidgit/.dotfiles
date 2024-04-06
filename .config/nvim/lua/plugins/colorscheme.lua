-- return {
-- 	"catppuccin/nvim",
-- 	priority = 1000,
-- 	--lazy = true,
-- 	name = "catppuccin",
-- 	opts = {
-- 		integrations = {
-- 			cmp = true,
-- 			gitsigns = true,
-- 			harpoon = true,
-- 			indent_blankline = { enabled = true, },
-- 			lsp_trouble = true,
-- 			mason = true,
-- 			markdown = true,
-- 			mini = true,
-- 			native_lsp = {
-- 				enabled = true,
-- 				underlines = {
-- 					errors = { "undercurl" },
-- 					hints = { "undercurl" },
-- 					warnings = { "undercurl" },
-- 					information = { "undercurl" },
-- 				},
-- 			},
-- 			navic = { enabled = true, custom_bg = "lualine" },
-- 			neotest = true,
-- 			notify = true,
-- 			telescope = true,
-- 			treesitter = true,
-- 			treesitter_context = true,
-- 			which_key = true,
-- 		},
-- 	},
-- 	config = function(_, opts)
-- 		require('catppuccin').setup(opts)
-- 		vim.cmd.colorscheme('catppuccin')
-- 	end
-- }

return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("everforest").setup({
			background = 'hard',
			contrast = 'high'
		})
		vim.cmd.colorscheme('everforest')
	end,
}

-- return {
-- 	'lmburns/kimbox',
-- 	config = function()
-- 		require('kimbox').setup({
-- 			style = 'eerie'
-- 		})
-- 		vim.cmd.colorscheme 'kimbox'
-- 	end
-- }
