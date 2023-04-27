return {
    {
        "catppuccin/nvim",
        name = "catppuccin"
    }, -- Theme
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
        build = ':TSUpdate'
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            { "lukas-reineke/lsp-format.nvim", config = true },
        }
    },
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
