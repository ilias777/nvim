return {
    -- === Treesitter ===
    {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufReadPre',
        build = ':TSUpdate',
        dependencies = {
            -- TS Textobjects
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
            -- TS Textsubjects
            { 'RRethy/nvim-treesitter-textsubjects' },
            -- TS Treehopper
            { 'mfussenegger/nvim-treehopper' },
            -- TS Context
            {
                'nvim-treesitter/nvim-treesitter-context',
                opts = {
                    max_lines = 3,
                },
            },
            -- TS Node-Action
            {
                'ckolkey/ts-node-action',
                keys = {
                    { '+', '<cmd>NodeAction<cr>', desc = 'Trigger Node Action' },
                },
                opts = {},
            },
        },
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'bash',
                    'bibtex',
                    'comment',
                    'cpp',
                    'css',
                    'html',
                    'http',
                    'java',
                    'javascript',
                    'jsdoc',
                    'json',
                    'json5',
                    'latex',
                    'lua',
                    'markdown',
                    'markdown_inline',
                    'make',
                    'php',
                    'python',
                    'query',
                    'regex',
                    'rust',
                    'scss',
                    'toml',
                    'vim',
                    'vue',
                    'yaml',
                },
                -- Buildin
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<CR>',
                        -- scope_incremental = '<CR>',
                        node_incremental = '<TAB>',
                        node_decremental = '<S-TAB>',
                    },
                },
                -- Textobjects
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ['af'] = { query = '@function.outer', desc = 'outer function' },
                            ['if'] = { query = '@function.inner', desc = 'inner function' },
                            ['ac'] = { query = '@conditional.outer', desc = 'outer conditional' },
                            ['ic'] = { query = '@conditional.inner', desc = 'inner conditional' },
                            ['al'] = { query = '@loop.outer', desc = 'outer loop' },
                            ['il'] = { query = '@loop.inner', desc = 'inner loop' },
                            ['am'] = { query = '@statement.outer', desc = 'outer statement' },
                            ['ix'] = { query = '@comment.outer', desc = 'comment' },
                        },
                        include_surrounding_whitespace = false,
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ['<space>s'] = { query = '@parameter.inner', desc = 'Swap next parameters' },
                        },
                        swap_previous = {
                            ['<space>S'] = { query = '@parameter.inner', desc = 'Swap previous parameters' },
                        },
                    },
                },
                -- Textsubjects
                textsubjects = {
                    enable = true,
                    keymaps = {
                        ['<cr>'] = 'textsubjects-smart', -- works in visual mode
                    },
                },
            })
        end,
    },
    -- Treesitter Playground
    {
        'nvim-treesitter/playground',
        cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor', 'TSNodeUnderCursor' },
    },
}
