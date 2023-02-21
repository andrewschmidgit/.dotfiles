local lsp = require('lsp-zero').preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'rust_analyzer'
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm(cmp_select),
    ['<C-Space>'] = cmp.mapping.select_prev_item(cmp_select),
})
 
lsp.set_preferences({
    sign_icons = { }
})

<<<<<<< Updated upstream
=======
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
end)

>>>>>>> Stashed changes
lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})
