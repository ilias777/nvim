return {
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                       COLORSCHEME                        │
    --  ╰──────────────────────────────────────────────────────────╯
    -- === Catppuccin ===
    {
        'catppuccin/nvim',
        lazy = false,
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('plugins.theme.catppuccin')
            vim.cmd('colorscheme catppuccin')
        end,
    },
    -- === Rose-Pine ===
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
    -- {
    --     'lalitmee/cobalt2.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     dependencies = {
    --         'tjdevries/colorbuddy.nvim',
    --     },
    --     config = function()
    --         require('colorbuddy').colorscheme('cobalt2')
    --     end,
    -- },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                           LSP                            │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('plugins.lspconf.lsp-config')
        end,
    },
    {
        'williamboman/mason.nvim',
        event = 'BufReadPre',
        build = ':MasonUpdate',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
        },
    },
    {
        'folke/neodev.nvim',
        event = 'VeryLazy',
        opts = {},
    },
    {
        'SmiteshP/nvim-navic',
        enabled = false,
        event = 'BufReadPre',
        dependencies = {
            'neovim/nvim-lspconfig',
        },
        opts = {
            highlight = true,
        },
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
    {
        'dnlhc/glance.nvim',
        keys = {
            { '<space>gr', '<cmd>Glance references<cr>', desc = 'Glance references' },
            { '<space>gd', '<cmd>Glance definitions<cr>', desc = 'Glance definitions' },
            { '<space>gy', '<cmd>Glance type_definitions<cr>', desc = 'Glance type_definitions' },
            { '<space>gm', '<cmd>Glance implementations<cr>', desc = 'Glance implementations' },
        },
        config = function()
            require('glance').setup()
        end,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                           CMP                            │
    --  ╰──────────────────────────────────────────────────────────╯
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
            'fazibear/cmp-nerdfonts',
            'octaltree/cmp-look',
        },
        config = function()
            require('plugins.lspconf.cmp')
        end,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                  LINTING AND FORMATING                   │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('plugins.lspconf.null-ls')
        end,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                         COMMENTS                         │
    --  ╰──────────────────────────────────────────────────────────╯
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
        config = true,
    },
    {
        'LudoPinelli/comment-box.nvim',
        cmd = { 'CBcatalog', 'CBcbox' },
        keys = {
            { '<leader>cb', '<cmd>CBcbox<cr>', desc = 'Comment Box' },
            { '<leader>cc', '<cmd>CBcatalog<cr>', desc = 'Comment Box Catalog' },
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

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                          UTILS                           │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'sudormrfbin/cheatsheet.nvim',
        keys = {
            { '<space>cs', '<cmd>Cheatsheet<cr>', desc = 'Cheatsheet' },
            { '<space>ce', '<cmd>CheatsheetEdit<cr>', desc = 'Cheatsheet Edit' },
        },
        dependencies = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        },
        opts = {
            bundled_plugin_cheatsheets = {
                disabled = { 'gitsigns.nvim' },
            },
        },
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
        'famiu/bufdelete.nvim',
        enabled = false,
        cmd = 'Bdelete',
        keys = {
            { '<space>bd', '<cmd>Bdelete<cr>', desc = 'Delete Buffer' },
        },
    },
    {
        'utilyre/sentiment.nvim',
        enabled = false,
        event = 'BufReadPre',
        version = '*',
        opts = {
            included_modes = {
                i = false,
            },
        },
        init = function()
            vim.g.loaded_matchparen = 1
        end,
    },
    {
        'chrisgrieser/nvim-spider',
        event = 'BufReadPost',
        config = function()
            -- Keymaps
            vim.keymap.set({ 'n', 'o', 'x' }, 'w', function()
                require('spider').motion('w')
            end, { desc = 'Spider-w' })
            vim.keymap.set({ 'n', 'o', 'x' }, 'e', function()
                require('spider').motion('e')
            end, { desc = 'Spider-e' })
            vim.keymap.set({ 'n', 'o', 'x' }, 'b', function()
                require('spider').motion('b')
            end, { desc = 'Spider-b' })
            vim.keymap.set({ 'n', 'o', 'x' }, 'ge', function()
                require('spider').motion('ge')
            end, { desc = 'Spider-ge' })
        end,
    },
    {
        'luukvbaal/statuscol.nvim',
        event = 'BufReadPre',
        config = function()
            local builtin = require('statuscol.builtin')
            require('statuscol').setup({
                relculright = true,
                segments = {
                    { sign = { name = { '.*' }, maxwidth = 1, colwidth = 1, auto = false }, click = 'v:lua.ScSa' },
                    { sign = { name = { 'Diagnostic' }, maxwidth = 1, auto = false }, click = 'v:lua.ScSa' },
                    { text = { builtin.lnumfunc, '  ' }, click = 'v:lua.ScLa' },
                    { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
                },
            })
        end,
    },
    {
        'simrat39/symbols-outline.nvim',
        cmd = 'SymbolsOutline',
        config = function()
            require('symbols-outline').setup()
        end,
    },
    {
        'brenoprata10/nvim-highlight-colors',
        enabled = true,
        event = 'BufReadPre',
        config = true,
    },
    {
        'chrisgrieser/nvim-alt-substitute',
        enabled = false,
        opts = true,
        -- lazy-loading with `cmd =` does not work well with incremental preview
        event = 'CmdlineEnter',
    },
    {
        'jokajak/keyseer.nvim',
        enabled = true,
        version = false,
        cmd = 'KeySeer',
        opts = {
            ui = {
                winblend = 100,
                border = 'rounded',
            },
            keyboard = {
                layout = 'qwertz',
            },
        },
    },
    {
        'luckasRanarison/nvim-devdocs',
        cmd = 'DevdocsOpen',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        opts = {},
    },
    {
        'ellisonleao/glow.nvim',
        cmd = 'Glow',
        config = true,
        opts = {
            border = 'single',
            style = 'dracula',
            width = 120,
            width_ratio = 0.8,
        },
    },
    {
        'yaocccc/nvim-hl-mdcodeblock.lua',
        enabled = true,
        ft = 'markdown',
        dependencies = { 'nvim-treesitter' },
        config = true,
        opts = {
            hl_group = 'CursorLine',
            minumum_len = 80,
            -- minumum_len = function()
            --     return math.max(math.floor(vim.api.nvim_win_get_width(0) * 0.8), 100)
            -- end,
        },
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                         WRITING                          │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'lervag/vimtex',
        ft = 'tex',
        init = function()
            vim.g.vimtex_view_method = 'skim'
        end,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                          MOTION                          │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'phaazon/hop.nvim',
        keys = {
            { '<leader>a', '<cmd>HopWord<cr>', desc = 'Hop Word' },
            { '<leader>hh', '<cmd>HopAnywhere<cr>', desc = 'Hop Anywhere' },
        },
        branch = 'v2',
        config = function()
            require('hop').setup()
        end,
    },
    {
        'rlane/pounce.nvim',
        enabled = false,
        keys = {
            { 'S', '<cmd>Pounce<CR>', mode = { 'n', 'v' } },
        },
    },
    {
        'declancm/cinnamon.nvim',
        keys = {
            { '<C-f>' },
            { '<C-b>' },
            { '<C-d>' },
            { '<C-u>' },
            { 'zz' },
            { 'zt' },
            { 'zb' },
        },
        config = function()
            -- vim.keymap.set({ 'n', 'x' }, '0', "<Cmd>lua Scroll('0')<CR>")
            -- vim.keymap.set({ 'n', 'x' }, '^', "<Cmd>lua Scroll('^')<CR>")
            -- vim.keymap.set({ 'n', 'x' }, '$', "<Cmd>lua Scroll('$', 0, 1)<CR>")
            vim.keymap.set('n', 'zz', "<Cmd>lua Scroll('zz', 0, 1)<CR>")
            vim.keymap.set('n', 'zt', "<Cmd>lua Scroll('zt', 0, 1)<CR>")
            vim.keymap.set('n', 'zb', "<Cmd>lua Scroll('zb', 0, 1)<CR>")
            require('cinnamon').setup({
                always_scroll = true,
                scroll_limit = 200,
            })
        end,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                          DEBUG                           │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'mfussenegger/nvim-dap',
        keys = {
            { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = 'Add Breakpoint' },
        },
        dependencies = {
            {
                'rcarriga/nvim-dap-ui',
                keys = {
                    { '<leader>du', '<cmd>lua require("dapui").toggle()<CR>', desc = 'DAP UI Toggle' },
                },
                config = true,
            },
            {
                'theHamsta/nvim-dap-virtual-text',
                opts = {
                    commented = true,
                    virt_text_pos = 'eol',
                },
            },
        },
        config = function()
            require('plugins.dap.debug_adapter')
        end,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                           JAVA                           │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'mfussenegger/nvim-jdtls',
        keys = {
            { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = 'Add Breakpoint' },
        },
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                        REST-HTML                         │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'diepm/vim-rest-console',
        enabled = false,
        ft = 'rest',
    },
}
