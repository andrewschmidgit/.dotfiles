return {
    { -- Theme
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function() 
            vim.cmd.colorscheme 'catppuccin'
        end
    },
    'nvim-lualine/lualine.nvim',
    'theprimeagen/vim-be-good',
    {
        'tpope/vim-fugitive',
        keys = {
            { '<leader>gs', '<cmd>Git<enter>' }
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects'
        },
        build = ':TSUpdate'
    },
    { -- LSP
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
            'folke/neodev.nvim'
        }
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
        },
        config = function()
            local lsp = require('lsp-zero').preset('recommended')

            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }

                vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
                vim.keymap.set('n', '<leader>ws', function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set('n', '<leader>rr', function() vim.lsp.buf.references() end, opts)
                vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
            end)

            require('neodev').setup()
            lsp.setup()

            local cmp = require 'cmp'
            local luasnip = require 'luasnip'

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert {
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-u>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete {},
                    ['<enter>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true
                    }
                }
            }
        end
    },
--    {
--        "VonHeikemen/lsp-zero.nvim",
--        dependencies = {
--            "neovim/nvim-lspconfig",
--            "williamboman/mason.nvim",
--            "williamboman/mason-lspconfig.nvim",
--            "hrsh7th/nvim-cmp",
--            "hrsh7th/cmp-buffer",
--            "hrsh7th/cmp-path",
--            "saadparwaiz1/cmp_luasnip",
--            "hrsh7th/cmp-nvim-lsp",
--            "hrsh7th/cmp-nvim-lua",
--            "L3MON4D3/LuaSnip",
--            "rafamadriz/friendly-snippets",
--            { "lukas-reineke/lsp-format.nvim", config = true },
--        }
--    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        tag = '2.59',
        keys = {
            { '<leader>pt', '<cmd>Neotree toggle<enter>' }
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
}
