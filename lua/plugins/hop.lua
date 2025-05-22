return {
    'smoka7/hop.nvim',
    version = '*',
    keys = {
        { '<space><space>', '<cmd>HopWord<cr>', desc = 'Hop Word' },
        { '<leader>ha', '<cmd>HopAnywhere<cr>', desc = 'Hop Anywhere' },
        { '<leader>hc', '<cmd>HopCamelCase<cr>', desc = 'Hop CamelCase' },
        { '<leader>hh', '<cmd>HopPattern<cr>', desc = 'Hop Pattern' },
        { '<leader>hl', '<cmd>HopLine<cr>', desc = 'Hop Line' },
        { '<leader>hn', '<cmd>HopNodes<cr>', desc = 'Hop Nodes' },
        { '<leader>hp', '<cmd>HopPasteChar1<cr>', desc = 'Hop Paste' },
        { '<leader>hv', '<cmd>HopVertical<cr>', desc = 'Hop Vertical' },
        { '<leader>hy', '<cmd>HopYankChar1<cr>', desc = 'Hop Yank' },
        { '<leader>h1', '<cmd>HopChar1<cr>', desc = 'Hop 1 Char' },
        { '<leader>h2', '<cmd>HopChar2<cr>', desc = 'Hop 2 Chars' },
    },
    config = true,
}
