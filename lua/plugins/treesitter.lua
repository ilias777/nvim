return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufReadPre',
        build = ':TSUpdate',
        dependencies = {
            'mrjones2014/nvim-ts-rainbow',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'mfussenegger/nvim-treehopper',
            'RRethy/nvim-treesitter-textsubjects',
        },
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'bibtex', 'comment', 'cpp', 'css', 'html', 'java', 'javascript', 'jsdoc', 'json', 'json5', 'latex', 'lua', 'markdown', 'markdown_inline', 'make', 'php', 'python', 'regex', 'rust', 'scss', 'toml', 'vim', 'vue', 'yaml' },
                -- Buildin
                highlight = {
                    enable = true,
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
                -- Rainbow
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
}
