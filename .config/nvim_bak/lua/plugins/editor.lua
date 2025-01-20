return {
	'tpope/vim-sleuth',
	{
		'rcarriga/nvim-notify',
		opts = {

		},
		config = function(_, opts)
			local n = require('notify')
			n.setup(opts)
			vim.notify = n
		end
	},
	{ -- hide keys
		'laytan/cloak.nvim',
		opts = {
			cloak_telescope = true,
			patterns = {
				{ file_pattern = '.env*', cloak_pattern = '=\".+\"' }
			}
		},
		keys = {
			{ "<leader>te", "<cmd>CloakToggle<cr>", desc = "Toggle Env" }
		}
	},
	{ -- pending keybinds
		'folke/which-key.nvim',
		event = 'VeryLazy',
		opts = {
			spec = {
				{ ']h', function() package.loaded.gitsigns.next_hunk() end, mode = 'n', desc = 'Next Hunk' },
				{ '[h', function() package.loaded.gitsigns.prev_hunk() end, mode = 'n', desc = 'Previous Hunk' },
				{
					mode = { 'n', 'v' },
					{ '<leader>c', group = 'code' },
					{ '<leader>d', group = 'document' },
					{
						'<leader>g',
						group = 'git',
						expand = function()
							local gs = package.loaded.gitsigns
							local function stage_hunk()
								gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
							end
							local function reset_hunk()
								gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
							end
							return {
								{ 's', gs.stage_hunk,                   mode = 'n',              desc = 'Stage Hunk' },
								{ 'r', gs.reset_hunk,                   mode = 'n',              desc = 'Reset Hunk' },
								{ 's', stage_hunk,                      mode = 'v',              desc = 'Stage Hunk' },
								{ 'r', reset_hunk,                      mode = 'v',              desc = 'Stage Hunk' },
								{ 'u', gs.undo_stage_hunk,              desc = 'Undo Stage Hunk' },
								{ 'p', gs.preview_hunk,                 desc = 'Preview Hunk' },

								{ 'S', gs.stage_buffer,                 mode = 'n',              desc = 'Stage Buffer' },
								{ 'R', gs.reset_buffer,                 mode = 'n',              desc = 'Reset Buffer' },

								{ 'b', gs.toggle_current_line_blame,    mode = 'n',              desc = 'Toggle Current Line Blame' },

								{ 'd', gs.diffthis,                     mode = 'n',              desc = 'Diff This' },
								{ 'D', function() gs.diffthis('~') end, mode = 'n',              desc = 'Diff This' },
							}
						end
					},
					{ '<leader>r', group = 'rename' },
					{ '<leader>s', group = 'search' },
					{ '<leader>t', group = 'toggle' },
					{ '<leader>w', group = 'workspace' },
				}
			}
		},
	},

	{ -- git signs
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			}
		},
	},
}
