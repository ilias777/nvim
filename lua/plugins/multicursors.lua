return {
    'smoka7/multicursors.nvim',
    enabled = false,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'smoka7/hydra.nvim',
    },
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
        {
            mode = { 'v', 'n' },
            '<Leader>m',
            '<cmd>MCstart<cr>',
            desc = 'Create Multicursor',
        },
    },
    opts = {},
}
