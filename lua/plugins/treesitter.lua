return {
    -- ──────────────────────── TREESITTER ─────────────────────
    {
        'nvim-treesitter/nvim-treesitter',
        event = { 'BufReadPre', 'BufNewFile' },
        build = ':TSUpdate',
        dependencies = {
            -- ────────────────────── TS TEXTOBJECTS ───────────────────
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
            -- ─────────────────────── TS TREEHOPPER ───────────────────────
            { 'mfussenegger/nvim-treehopper' },
            -- ──────────────────────── TS CONTEXT ─────────────────────
            {
                'nvim-treesitter/nvim-treesitter-context',
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
                    'csv',
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
                    'sql',
                    'toml',
                    'typescript',
                    'typst',
                    'vim',
                    'vimdoc',
                    'vue',
                    'yaml',
                },
                highlight = {
                    enable = true,
                },
                -- Buildin
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<CR>',
                        scope_incremental = '<CR>',
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
            })
        end,
    },
    -- ──────────────────────── TS AUTOTAG ─────────────────────
    {
        'windwp/nvim-ts-autotag',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {},
    },
    -- ────────────────────── TS NODE ACTION ───────────────────
    {
        'ckolkey/ts-node-action',
        keys = {
            { '+', '<cmd>NodeAction<cr>', desc = 'Trigger Node Action' },
        },
        opts = {},
    },
}
