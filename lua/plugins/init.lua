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
        enabled = false,
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
        'nvim-zh/colorful-winsep.nvim',
        enabled = true,
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            only_line_seq = false,
        },
    },
    {
        'gorbit99/codewindow.nvim',
        enabled = true,
        keys = {
            { '<leader>mm' },
            { '<leader>mc' },
            { '<leader>mf' },
            { '<leader>mo' },
        },
        config = function()
            local codewindow = require('codewindow')
            codewindow.setup({
                z_index = 20,
            })
            codewindow.apply_default_keybinds()
            vim.api.nvim_set_hl(0, 'CodewindowBorder', { link = 'FloatBorder' })
        end,
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                         COLORS                          │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'uga-rosa/ccc.nvim',
        keys = {
            { '<leader>cc', '<cmd>CccPick<cr>', desc = 'Color Picker' },
        },
        opts = {
            win_opts = {
                border = 'single',
            },
        },
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
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
        version = '1.*',
        opts = {
            invert_colors = 'auto',
        },
    },
    {
        'iamcco/markdown-preview.nvim',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        ft = 'markdown',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
    },
    {
        'Myzel394/easytables.nvim',
        ft = 'markdown',
        config = true,
    },
    {
        'Kicamon/markdown-table-mode.nvim',
        ft = 'markdown',
        config = true,
    },
    {
        'OXY2DEV/markview.nvim',
        enabled = true,
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local presets = require('markview.presets').headings
            require('markview').setup({
                markdown = {
                    headings = presets.glow,
                },
                typst = {
                    enable = false,
                },
                preview = {
                    icon_provider = 'devicons', -- "mini" or "devicons" or "internal"
                },
            })
        end,
    },
    {
        'barreiroleo/ltex-extra.nvim',
        enabled = true,
        ft = { 'markdown', 'tex', 'typst' },
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
            { '<leader>ha', '<cmd>HopAnywhere<cr>', desc = 'Hop Anywhere' },
            { '<leader>hc', '<cmd>HopCamelCase<cr>', desc = 'Hop CamelCase' },
            { '<leader>hh', '<cmd>HopPattern<cr>', desc = 'Hop Pattern' },
            { '<leader>hl', '<cmd>HopLine<cr>', desc = 'Hop Line' },
            { '<leader>hn', '<cmd>HopNodes<cr>', desc = 'Hop Nodes' },
            { '<leader>hp', '<cmd>HopPasteChar1<cr>', desc = 'Hop Paste' },
            { '<leader>hv', '<cmd>HopVertical<cr>', desc = 'Hop Vertical' },
            { '<leader>hy', '<cmd>HopYankChar1<cr>', desc = 'Hop Yank' },
            { '<leader>h1', '<cmd>HopChar1<cr>', desc = 'Hop 1 Char' },
            { '<leader>h2', '<cmd>HopChar2<cr>', desc = 'Hop 2 Chars' },
        },
        config = true,
    },
    {
        'declancm/cinnamon.nvim',
        enabled = false,
        event = 'VeryLazy',
        version = '*',
        opts = {
            keymaps = {
                basic = true,
                extra = true,
            },
        },
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
