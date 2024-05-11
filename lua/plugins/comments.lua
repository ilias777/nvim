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
        dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
        config = function()
            require('Comment').setup({
                pre_hook = function()
                    return vim.bo.commentstring
                end,
            })
        end,
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                   TODO-COMMENTS.NVIM                    │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'folke/todo-comments.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = 'nvim-lua/plenary.nvim',
        config = true,
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                    COMMENT-BOX.NVIM                     │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'LudoPinelli/comment-box.nvim',
        cmd = { 'CBcatalog', 'CBcbox' },
        keys = {
            { '<leader>cb', '<cmd>CBlcbox<cr>', desc = 'Comment Box' },
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
        enabled = true,
        keys = {
            { '<leader>cf', desc = 'Single Comment Frame' },
            { '<leader>cm', desc = 'Multi Comment Frame' },
        },
        dependencies = 'nvim-treesitter',
        config = true,
    },
}
