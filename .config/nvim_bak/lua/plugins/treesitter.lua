return {
	'nvim-treesitter/nvim-treesitter',
	version = false,
	build = ':TSUpdate',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			'bash',
			'css',
			'go',
			'html',
			'javascript',
			'lua',
			'markdown',
			'markdown_inline',
			'regex',
			'rust',
			'svelte',
			'typescript',
			'vim',
			'vimdoc',
			'xml',
			'yaml',
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = '<c-space>',
				node_incremental = '<c-space>',
				node_decremental = '<bs>',
				scope_incremental = false,
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj

				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					['aa'] = '@parameter.outer',
					['ia'] = '@parameter.inner',
					['af'] = '@function.outer',
					['if'] = '@function.inner',
					['ac'] = '@class.outer',
					['ic'] = '@class.inner',
				},
			},
		},
	},
	config = function(_, opts)
		require('nvim-treesitter.configs').setup(opts)
	end,
}
