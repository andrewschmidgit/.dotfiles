local function lsp_attach_callback(event)
	-- keymaps
	local map = function(keys, func, desc, mode)
		vim.keymap.set(mode or 'n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
	end

	map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
	map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementations')

	map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

	map('<leader>cr', vim.lsp.buf.rename, '[R]e[n]ame')
	map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

	-- vim.api.nvim_create_autocmd("BufWritePre", {
	-- 	-- 3
	-- 	buffer = event.buf,
	-- 	callback = function()
	-- 		-- 4 + 5
	-- 		vim.lsp.buf.format { async = false, id = event.data.client_id }
	-- 	end,
	-- })
end

return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',

			{ 'j-hui/fidget.nvim', opts = {} },

			-- completions
			'saghen/blink.cmp',
		},
		opts = {
			servers = {
				bashls = {},
				csharp_ls = {},
				cssls = {},
				emmet_language_server = {},
				html = { },
				jsonls = {},
				lua_ls = {},
				rust_analyzer = {},
				svelte = {},
				tailwindcss = {},
				terraformls = {},
				ts_ls = {}
			}
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
				callback = lsp_attach_callback
			})

			require('mason').setup()
			require('mason-tool-installer').setup { ensure_installed = vim.tbl_keys(opts.servers) }

			local lspconfig = require('lspconfig')
			local blink = require('blink.cmp')
			for server, config in pairs(opts.servers) do
				config.capabilities = blink.get_lsp_capabilities(config.capabilities)

				lspconfig[server].setup(config)
			end
		end
	}
}
