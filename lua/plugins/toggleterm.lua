return {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
        { '<leader>t', '<cmd>ToggleTerm<cr>', desc = 'ToggleTerm' },
    },
    config = true,
    opts = {
        direction = 'float',
    },
}
