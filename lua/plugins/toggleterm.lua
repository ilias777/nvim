return {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
        { '<space>t', '<cmd>ToggleTerm<cr>', desc = 'ToggleTerm' },
    },
    config = true,
    opts = {
        open_mapping = [[<c-7>]],
        direction = 'float',
    },
}
