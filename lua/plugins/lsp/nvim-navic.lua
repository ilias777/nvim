return {
    'SmiteshP/nvim-navic',
    enabled = true,
    event = 'BufReadPre',
    dependencies = {
        'neovim/nvim-lspconfig',
    },
    opts = {
        highlight = true,
        separator = '   ',
    },
}
