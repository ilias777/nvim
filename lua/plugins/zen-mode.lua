return {
    'folke/zen-mode.nvim',
    keys = {
        { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Zen Mode' },
    },
    opts = {
        window = {
            backdrop = 1,
            width = 0.7,
            height = 0.8,
        },
        plugins = {
            options = {
                enabled = true,
                laststatus = 0,
            },
        },
    },
}
