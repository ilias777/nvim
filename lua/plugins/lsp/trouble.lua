return {
    'folke/trouble.nvim',
    keys = {
        { '<space>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
        { '<space>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
        { '<space>xs', '<cmd>Trouble symbols toggle<cr>', desc = 'Symbols (Trouble)' },
        {
            '<space>xr',
            '<cmd>Trouble lsp toggle win.position=right<cr>',
            desc = 'LSP Definitions / references / ... (Trouble)',
        },
        { '<space>xl', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
        { '<space>xq', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
        { '<space>xt', '<cmd>Trouble todo<cr>', desc = 'Todo Trouble' },
    },
    opts = {
        focus = true,
    },
}
