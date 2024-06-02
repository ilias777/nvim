return {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
        { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'ToggleTerm' },
    },
    config = true,
    opts = {
        direction = 'float',
    },
}
