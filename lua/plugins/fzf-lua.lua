return {
    'ibhagwan/fzf-lua',
    enabled = true,
    keys = {
        { '<M-p>', "<cmd>lua require('fzf-lua').files()<cr>", desc = 'FZF Files' },
    },
    opts = {
        winopts = {
            border = 'single',
        },
        preview = {
            hidden = 'hidden',
        },
        keymap = {
            builtin = {
                ['<C-d>'] = 'preview-page-down',
                ['<C-u>'] = 'preview-page-up',
                ['<S-down>'] = 'preview-page-down',
                ['<S-up>'] = 'preview-page-up',
            },
        },
    },
    config = true,
}
