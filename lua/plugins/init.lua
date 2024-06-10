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

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                  FORMATING AND LINTING                   │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'stevearc/conform.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            formatters_by_ft = {
                css = { 'prettier' },
                html = { 'prettier' },
                java = { 'prettier' },
                javascript = { 'prettier' },
                json = { 'prettier' },
                tex = { 'latexindent' },
                lua = { 'stylua' },
                markdown = { 'prettier' },
                php = { 'prettier' },
                python = { 'black' },
                rust = { 'rustfmt' },
                scss = { 'prettier' },
                typst = { 'typstyle' },
                vue = { 'prettier' },
                yaml = { 'yamlfmt' },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            },
            -- formatters = {
            --     latexindent = {
            --         prepend_args = { '-l', '/Users/ilias/.indentconfig.yaml' },
            --     },
            -- },
        },
    },
    {
        'mfussenegger/nvim-lint',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local lint = require('lint')
            lint.linters_by_ft = {
                javascript = { 'eslint' },
                json = { 'jsonlint' },
                -- lua = { 'luacheck' },
                python = { 'ruff' },
                vue = { 'eslint' },
                yaml = { 'yamllint' },
            }
            local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
            vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                          UTILS                           │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'sudormrfbin/cheatsheet.nvim',
        enabled = false,
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
        'brenoprata10/nvim-highlight-colors',
        enabled = true,
        event = 'BufReadPre',
        opts = {
            render = 'virtual', ---@usage 'background'|'foreground'|'virtual'
            virtual_symbol = '',
        },
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
        enabled = false,
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
        cmd = { 'DevdocsOpen', 'DevdocsOpenFloat' },
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        opts = {
            float_win = {
                relative = 'editor',
                height = math.floor(vim.o.lines * 0.7),
                width = math.floor(vim.o.columns * 0.8),
                border = 'rounded',
            },
            wrap = true,
            after_open = function()
                vim.keymap.set('n', 'q', ':close<CR>', { silent = true })
            end,
        },
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
        enabled = false,
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
    {
        'nvim-zh/colorful-winsep.nvim',
        enabled = true,
        event = { 'BufReadPre', 'BufNewFile' },
        config = true,
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                      COLOR PICKER                       │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'uga-rosa/ccc.nvim',
        keys = {
            { '<leader>cc', '<cmd>CccPick<cr>', desc = 'Color Picker' },
        },
        config = true,
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
    {
        'kaarmu/typst.vim',
        ft = 'typst',
    },
    {
        'chomosuke/typst-preview.nvim',
        enabled = false,
        ft = 'typst',
        version = '0.1.*',
        build = function()
            require('typst-preview').update()
        end,
    },
    {
        'MeanderingProgrammer/markdown.nvim',
        enabled = false,
        name = 'render-markdown',
        ft = 'markdown',
        keys = {
            {
                '<leader>mt',
                function()
                    require('render-markdown').toggle()
                end,
                desc = 'Toogle markdown view',
            },
        },
        config = true,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                          MOTION                          │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'smoka7/hop.nvim',
        version = '*',
        keys = {
            { '<space><space>', '<cmd>HopWord<cr>', desc = 'Hop Word' },
            { '<leader>hh', '<cmd>HopAnywhere<cr>', desc = 'Hop Anywhere' },
        },
        config = true,
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
        cmd = { 'DapToggleBreakpoint' },
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
