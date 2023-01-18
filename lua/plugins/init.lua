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
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('plugins.lspconf.lsp-config')
        end,
    },
    {
        'folke/trouble.nvim',
        keys = {
            { '<leader>xx', '<cmd>TroubleToggle<cr>', desc = 'Trouble Toggle' },
            { 'gr', '<cmd>TroubleToggle lsp_references<cr>' },
        },
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('trouble').setup()
        end,
    },

    -- CMP
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
            'ray-x/cmp-treesitter',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lua',
            'f3fora/cmp-spell',
            'hrsh7th/cmp-path',
        },
        config = function()
            require('plugins.lspconf.cmp')
        end,
    },

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
    -- {
    --     'nvim-telescope/telescope-file-browser.nvim',
    --     keys = {
    --         { '<leader>fe', '<cmd>Telescope file_browser<cr>', decs = 'Browse Files' },
    --     },
    -- },
    -- {
    --     'nvim-telescope/telescope-symbols.nvim',
    --     keys = {
    --         { '<leader>fs', '<cmd>Telescope symbols<cr>', decs = 'Find Symbols' },
    --     },
    -- },
    -- {
    --     'xiyaowong/telescope-emoji.nvim',
    --     keys = {
    --         { '<leader>fj', '<cmd>Telescope emoji<cr>', decs = 'Find Emoji' },
    --     },
    -- },
    {
        'sudormrfbin/cheatsheet.nvim',
        keys = {
            { '<leader>ö', '<cmd>Cheatsheet<cr>', desc = 'Cheatsheet' },
        },
    },

    -- TREESITTER
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'mrjones2014/nvim-ts-rainbow',
        },
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'bibtex', 'comment', 'cpp', 'css', 'html', 'java', 'javascript', 'jsdoc', 'json', 'json5', 'latex', 'lua', 'markdown', 'markdown_inline', 'make', 'php', 'python', 'regex', 'rust', 'scss', 'toml', 'vim', 'vue', 'yaml' },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                    colors = {
                        '#C678DD',
                        '#98C379',
                        '#E06C75',
                        '#E5C07B',
                        '#56B6C2',
                        '#61AFEF',
                        '#E06C75',
                    }, -- table of hex strings
                },
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        event = 'BufReadPre',
        config = function()
            require('treesitter-context').setup()
        end,
    },
    {
        'nvim-treesitter/playground',
        cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor', 'TSNodeUnderCursor' },
    },

    -- COMMENTS
    {
        'numToStr/Comment.nvim',
        keys = {
            { 'gc', mode = 'v' },
            { 'gb', mode = 'v' },
            { 'gcc' },
            { 'gbc' },
            { 'gco' },
            { 'gcO' },
            { 'gcA' },
        },
        config = function()
            require('Comment').setup()
        end,
    },
    {
        'LudoPinelli/comment-box.nvim',
        cmd = { 'CBcatalog', 'CBcbox' },
        keys = {
            { '<leader>cbc', '<cmd>CBcbox<cr>', desc = 'Comment Box' },
        },
    },
    {
        's1n7ax/nvim-comment-frame',
        keys = {
            { '<leader>cf', desc = 'Single Comment Frame' },
            { '<leader>cm', desc = 'Multi Comment Frame' },
        },
        dependencies = 'nvim-treesitter',
        config = function()
            require('nvim-comment-frame').setup()
        end,
    },

    -- UTILS
    {
        'L3MON4D3/LuaSnip',
        event = 'InsertEnter',
    },
    {
        'rafamadriz/friendly-snippets',
        event = 'BufReadPre',
    },
    {
        'smjonas/live-command.nvim',
        event = 'CmdlineEnter',
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
        keys = {
            { '<leader>w', desc = 'Toggle Word' },
        },
        config = function()
            require('nvim-toggler').setup({
                remove_default_keybinds = true,
            })
            vim.keymap.set({ 'n', 'v' }, '<leader>w', require('nvim-toggler').toggle, { desc = 'Toggle a Word' })
        end,
    },
    {
        'ur4ltz/surround.nvim',
        keys = {
            { 's', mode = { 'n', 'v' } },
        },
        config = function()
            require('surround').setup({
                mappings_style = 'sandwich',
            })
        end,
    },
    {
        'mg979/vim-visual-multi',
        event = 'BufReadPost',
    },
    {
        'Pocco81/true-zen.nvim',
        cmd = { 'TZFocus', 'TZNarrow', 'TZAtaraxis', 'TZMinimalist' },
        keys = {
            { '<leader>z', '<cmd>TZAtaraxis<cr>', desc = 'Zen Mode' },
        },
        config = function()
            require('true-zen').setup()
        end,
    },
    {
        'famiu/bufdelete.nvim',
        cmd = 'Bdelete',
        keys = {
            { '<space>bd', '<cmd>Bdelete<cr>', desc = 'Delete Buffer' },
        },
    },

    -- VIMTEX
    {
        'lervag/vimtex',
        ft = 'tex',
        config = function()
            vim.g.vimtex_view_method = 'skim'
            vim.g.vimtex_compiler_engine = 'lualatex'
            vim.g.maplocalleader = ','
        end,
    },

    -- COLORS
    {
        'norcalli/nvim-colorizer.lua',
        event = 'BufReadPre',
        config = function()
            require('colorizer').setup()
        end,
    },

    -- MOTION
    {
        'phaazon/hop.nvim',
        keys = {
            { '<leader>a', '<cmd>HopWord<cr>', desc = 'Hop Word' },
            { '<leader>ha', '<cmd>HopAnywhere<cr>', desc = 'Hop Anywhere' },
        },
        branch = 'v2',
        config = function()
            require('hop').setup()
        end,
    },
    {
        'rlane/pounce.nvim',
        keys = {
            { 'S', '<cmd>Pounce<CR>', mode = { 'n', 'v' } },
        },
    },

    -- GIT
    {
        'sindrets/diffview.nvim',
        cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('diffview').setup()
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPre',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('gitsigns').setup()
        end,
    },
    {
        'TimUntersberger/neogit',
        keys = {
            { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Neogit' },
        },
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
        keys = {
            { '<leader>du', '<cmd>lua require("dapui").toggle()<CR>', desc = 'DAP UI Toggle' },
        },
        dependencies = 'mfussenegger/nvim-dap',
        config = function()
            require('dapui').setup()
        end,
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        keys = {
            { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = 'Add Breakpoint' },
        },
        config = function()
            require('nvim-dap-virtual-text').setup()
        end,
    },

    -- JAVA
    {
        'mfussenegger/nvim-jdtls',
        keys = {
            { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = 'Add Breakpoint' },
        },
    },
}
