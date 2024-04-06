local callback = function(event)
	local map = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
	end

	map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
	map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
	map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

	map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	map('K', vim.lsp.buf.hover, 'Hover Documentation')
	map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
end

return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'folke/neodev.nvim',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			{ 'j-hui/fidget.nvim', opts = {} },
		},
		opts = {
			servers = {
				bashls = {},
				html = {},
				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
				marksman = {},
				rust_analyzer = {},
				svelte = {},
				terraformls = {},
				tsserver = {},
			},
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
				callback = callback
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			require('mason').setup()
			require('mason-lspconfig').setup({
				ensure_installed = vim.tbl_keys(opts.servers),
				handlers = {
					function(server_name)
						local server = opts.servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
						require('lspconfig')[server_name].setup(server)
					end
				}
			})
		end,
	}
}
