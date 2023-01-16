return {
    -- COLORSCHEME
    -- Catppuccin
    {
        'catppuccin/nvim',
        lazy = false,
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('plugins.theme.catppuccin')
            vim.cmd('colorscheme catppuccin-macchiato')
        end,
    },
    -- Rose-Pine
    -- {
    --     'rose-pine/neovim',
    --     lazy = false,
    --     name = 'rose-pine',
    --     priority = 1000,
    --     config = function()
    --         require('plugins.theme.rose-pine')
    --         vim.cmd('colorscheme rose-pine')
    --     end,
    -- },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        config = function()
            require('plugins.lspconf.lsp-config')
        end,
    },
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('trouble').setup()
        end,
    },

    -- CMP
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function()
            require('plugins.lspconf.cmp')
        end,
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'ray-x/cmp-treesitter',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'f3fora/cmp-spell',

    -- SYMBOLS OUTLINE LSP
    {
        'simrat39/symbols-outline.nvim',
        cmd = 'SymbolsOutline',
        config = function()
            require('symbols-outline').setup()
        end,
    },

    -- NULL-LS
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('plugins.lspconf.null-ls')
        end,
    },

    -- TELESCOPE
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-symbols.nvim',
    'xiyaowong/telescope-emoji.nvim',

    -- TREESITTER
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'bibtex', 'comment', 'cpp', 'css', 'html', 'java', 'javascript', 'jsdoc', 'json', 'json5', 'latex', 'lua', 'markdown', 'markdown_inline', 'make', 'php', 'python', 'regex', 'rust', 'scss', 'toml', 'vim', 'vue', 'yaml' },
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require('treesitter-context').setup()
        end,
    },
    'nvim-treesitter/playground',

    -- COMMENTS
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    },
    'LudoPinelli/comment-box.nvim',
    {
        's1n7ax/nvim-comment-frame',
        dependencies = 'nvim-treesitter',
        config = function()
            require('nvim-comment-frame').setup()
        end,
    },

    -- UTILS
    'nvim-lua/plenary.nvim',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    {
        'smjonas/live-command.nvim',
        config = function()
            require('live-command').setup({
                commands = {
                    Norm = { cmd = 'norm' },
                },
            })
        end,
    },
    {
        'nguyenvukhang/nvim-toggler',
        config = function()
            require('nvim-toggler').setup({
                remove_default_keybinds = true,
            })
            vim.keymap.set({ 'n', 'v' }, '<leader>w', require('nvim-toggler').toggle, { desc = 'Toggle a Word' })
        end,
    },
    {
        'ur4ltz/surround.nvim',
        config = function()
            require('surround').setup({
                mappings_style = 'sandwich',
            })
        end,
    },
    'mg979/vim-visual-multi',
    {
        'Pocco81/true-zen.nvim',
        config = function()
            require('true-zen').setup()
        end,
    },
    'famiu/bufdelete.nvim',

    -- STATUSLINES

    -- VIMTEX
    {
        'lervag/vimtex',
        ft = 'tex',
    },

    -- COLORS
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },

    -- MOTION
    {
        'phaazon/hop.nvim',
        version = 'v2',
        config = function()
            require('hop').setup()
        end,
    },
    'rlane/pounce.nvim',

    -- GIT
    {
        'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('diffview').setup()
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('gitsigns').setup()
        end,
    },
    {
        'TimUntersberger/neogit',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('neogit').setup({
                disable_commit_confirmation = true,
                integrations = {
                    diffview = true,
                },
            })
        end,
    },

    -- DAP
    {
        'rcarriga/nvim-dap-ui',
        dependencies = 'mfussenegger/nvim-dap',
        config = function()
            require('dapui').setup()
        end,
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
            require('nvim-dap-virtual-text').setup()
        end,
    },

    -- JAVA
    'mfussenegger/nvim-jdtls',
}
