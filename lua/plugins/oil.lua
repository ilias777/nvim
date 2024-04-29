return {
    'stevearc/oil.nvim',
    enabled = false,
    keys = {
        { '<Space>o', '<cmd>Oil --float<cr>', desc = 'File browser' },
    },
    opts = {
        float = {
            max_width = 100,
            max_height = 80,
        },
    },
}
