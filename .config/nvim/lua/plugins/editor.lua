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
			patterns = {
				{ file_pattern = '.env*', cloak_pattern = '=\".+\"' }
			}
		}
	},
	{ -- pending keybinds
		'folke/which-key.nvim',
		event = 'VeryLazy',
		opts = {
			defaults = {
				mode = { 'n', 'v' },
				['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
				['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
				['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
				['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
				['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
				['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
				['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
			},
		},
		config = function(_, opts)
			local wk = require('which-key')
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
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
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")
				map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
				map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "<leader>gs", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>gr", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>gp", gs.preview_hunk_inline, "Preview Hunk Inline")
				map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
				map("n", "<leader>gd", gs.diffthis, "Diff This")
				map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
			end
		},
	},
}
