return {
    -- ╭─────────────────────────────────────────────────────────╮
    -- │                      COMMENT.NVIM                       │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'numToStr/Comment.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        keys = {
            { 'gc', mode = 'v' },
            { 'gb', mode = 'v' },
            { 'gcc' },
            { 'gbc' },
            { 'gco' },
            { 'gcO' },
            { 'gcA' },
        },
        dependencies = {
            {
                'JoosepAlviste/nvim-ts-context-commentstring',
                config = function()
                    require('ts_context_commentstring').setup({
                        enable_autocmd = false,
                    })
                end,
            },
        },
        config = function()
            require('Comment').setup({
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
                -- pre_hook = function()
                --     return vim.bo.commentstring
                -- end,
            })
        end,
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                   TODO-COMMENTS.NVIM                    │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'folke/todo-comments.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        keys = {
            { '<leader>tq', '<cmd>TodoQuickFix<cr>', desc = 'Todo QuickFix' },
            { '<leader>tl', '<cmd>TodoLocList<cr>', desc = 'Todo LocList' },
            { '<leader>ts', '<cmd>TodoTelescope<cr>', desc = 'Todo Telescope' },
        },
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                    COMMENT-BOX.NVIM                     │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'LudoPinelli/comment-box.nvim',
        cmd = { 'CBcatalog', 'CBcbox' },
        keys = {
            { '<leader>cb', '<cmd>CBlcbox<cr>', desc = 'Comment Box Big' },
            { '<leader>cd', '<cmd>CBd<cr>', desc = 'Comment Box Delete' },
            { '<leader>ca', '<cmd>CBalbox<cr>', desc = 'Comment Box Auto' },
            { '<leader>cl', '<cmd>CBcatalog<cr>', desc = 'Comment Box Catalog' },
        },
        opts = {
            line_width = 60,
        },
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                   NVIM-COMMENT-FRAME                    │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        's1n7ax/nvim-comment-frame',
        enabled = false,
        keys = {
            { '<leader>cf', desc = 'Single Comment Frame' },
            { '<leader>cm', desc = 'Multi Comment Frame' },
        },
        dependencies = 'nvim-treesitter',
        config = true,
    },
}
