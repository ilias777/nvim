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
        'nvim-zh/colorful-winsep.nvim',
        enabled = true,
        event = { 'BufReadPre', 'BufNewFile' },
        config = true,
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                         COLORS                          │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'uga-rosa/ccc.nvim',
        keys = {
            { '<leader>cc', '<cmd>CccPick<cr>', desc = 'Color Picker' },
        },
        config = true,
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
        'declancm/cinnamon.nvim',
        enabled = true,
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('cinnamon').setup({
                keymaps = {
                    extra = true,
                },
                options = {
                    max_delta = {
                        column = 100,
                    },
                },
            })
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
            'theHamsta/nvim-dap-virtual-text',
            opts = {
                commented = true,
                virt_text_pos = 'eol',
            },
        },
        config = function()
            require('plugins.dap.debug_adapter')
        end,
    },
    {
        'rcarriga/nvim-dap-ui',
        keys = {
            { '<leader>du', '<cmd>lua require("dapui").toggle()<CR>', desc = 'DAP UI Toggle' },
        },
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
        config = true,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                           JAVA                           │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'mfussenegger/nvim-jdtls',
        ft = 'java',
        dependencies = {
            'mfussenegger/nvim-dap',
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
