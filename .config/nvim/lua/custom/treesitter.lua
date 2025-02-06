local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = {
		'c',
		'css',
		'dockerfile',
		'html',
		'javascript',
		'just',
		'lua',
		'markdown',
		'markdown_inline',
		'rust',
		'svelte',
		'terraform',
		'typescript',
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
