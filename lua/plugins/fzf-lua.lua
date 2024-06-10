return {
    'ibhagwan/fzf-lua',
    enabled = true,
    keys = {
        { '<M-p>', "<cmd>lua require('fzf-lua').files()<cr>", desc = 'FZF Files' },
    },
    config = true,
}
