return {
    'stevearc/oil.nvim',
    enabled = true,
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        { '<Space>e', '<cmd>Oil<cr>', desc = 'File browser' },
    },
    opts = {},
    config = true,
}
