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
            options = {
                signcolumn = 'no',
                number = false,
                relativenumber = false,
                cursorline = false,
                cursorcolumn = false,
                foldcolumn = '0',
                list = false,
            },
        },
        plugins = {
            gitsigns = { enabled = true },
        },
    },
}
