local set = vim.keymap.set

set('n', '<leader>x', '<cmd>source %<enter>', { desc = 'Execute the current buffer' })

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Visual mode, use J and K to move lines up and down
set('v', 'J', ":m '>+1<enter>gv=gv")
set('v', 'K', ":m '<-2<enter>gv=gv")

-- Leaves cursor alone when joining line below
set('n', 'J', 'mzJ`z')

-- Recenters cursor y-position when navigating up and down
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')
