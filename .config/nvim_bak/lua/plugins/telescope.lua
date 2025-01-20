local function find_git_root()
	-- Use the current buffer's path as the starting point for the git search
	local current_file = vim.api.nvim_buf_get_name(0)
	local current_dir

	local cwd = vim.fn.getcwd()
	-- If the buffer is not associated with a file, return nil
	if current_file == '' then
		current_dir = cwd
	else
		-- Extract the directory from the current file's path
		current_dir = vim.fn.fnamemodify(current_file, ':h')
	end

	-- Find the Git root directory from the current file's path
	local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
	if vim.v.shell_error ~= 0 then
		print 'Not a git repository. Searching on current working directory'
		return cwd
	end

	return git_root
end

local function live_grep_git_root()
	local git_root = find_git_root()
	if git_root then
		require('telescope.builtin').live_grep {
			search_dirs = { git_root },
		}
	end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

local function set_keymaps()
	local set = vim.keymap.set
	set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
	set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
	set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
	set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
	set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
	set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
	set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
	set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
	set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
	set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
	set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })


	set('n', '<leader>/', function()
		-- You can pass additional configuration to telescope to change theme, layout, etc.
		require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
			winblend = 10,
			previewer = false,
		})

	end, { desc = '[/] Fuzzily search in current buffer' })


	set('n', '<leader>s/', function()
		require('telescope.builtin').live_grep({
			grep_open_files = true,
			prompt_title = 'Live Grep in Open Files'
		})
	end, { desc = '[S]earch [/] in Open Files' })
end

return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		}
	},
	init = function()
		set_keymaps()
	end,
	opts = {
		defaults = {
			mappings = {
				i = {
					['<C-u>'] = false,
					['<C-d>'] = false,
				},
			},
		},
	},
	config = function(_, opts)
		local ts = require('telescope')
		ts.setup(opts)
		ts.load_extension('fzf')
	end,
}
