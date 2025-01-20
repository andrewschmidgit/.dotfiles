-- from @tjdevries

local state = {
	win = -1,
	buf = -1,
}

local function open_floating_window(opts)
	-- Get the dimensions of the current window
	local screen_width = vim.o.columns
	local screen_height = vim.o.lines

	-- Calculate the size of the floating window (80% of the screen)
	local win_width = math.floor(screen_width * 0.8)
	local win_height = math.floor(screen_height * 0.8)

	-- Calculate the position to center the floating window
	local win_row = math.floor((screen_height - win_height) / 2)
	local win_col = math.floor((screen_width - win_width) / 2)

	-- Define the options for the floating window
	local window_options = {
		relative = 'editor', -- Use the whole editor as the reference
		width = win_width,
		height = win_height,
		row = win_row,
		col = win_col,
		style = 'minimal', -- A minimal window (no borders or title)
		border = 'rounded', -- Border type (rounded in this case)
	}

	local buf = nil
	if not vim.api.nvim_buf_is_valid(opts.buf) then
		buf = vim.api.nvim_create_buf(false, true) -- Create an empty buffer
	else
		buf = opts.buf
	end

	-- Open the floating window with the options
	local win = vim.api.nvim_open_win(buf, true, window_options) -- Open the floating window

	return { buf = buf, win = win }
end

local function toggle_floatterm()
	if not vim.api.nvim_win_is_valid(state.win) then
		state = open_floating_window { buf = state.buf }
		if vim.bo[state.buf].buftype ~= 'terminal' then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(state.win)
	end
end

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', {})
vim.keymap.set({ 'n', 't' }, '<leader>t', toggle_floatterm, {})

vim.api.nvim_create_user_command('Floaterm', toggle_floatterm, {})
