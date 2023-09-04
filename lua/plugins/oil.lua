return {
    'stevearc/oil.nvim',
    enabled = false,
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        { '<Space>o', '<cmd>Oil<cr>', desc = 'File browser' },
    },
    opts = {},
    config = true,
}
