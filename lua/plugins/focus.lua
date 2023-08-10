return {
    'nvim-focus/focus.nvim',
    enabled = true,
    version = '*',
    keys = {
        { '<space>h', '<cmd>FocusSplitLeft<CR>', desc = 'Focus Split Left' },
        { '<space>j', '<cmd>FocusSplitDown<CR>', desc = 'Focus Split Down' },
        { '<space>k', '<cmd>FocusSplitUp<CR>', desc = 'Focus Split Up' },
        { '<space>l', '<cmd>FocusSplitRight<CR>', desc = 'Focus Split Right' },
        { '<space>m', '<cmd>FocusMaxOrEqual<CR>', desc = 'Maximaze or Equalises Split' },
    },
    opts = {
        autoresize = {
            enable = false,
        },
        ui = {
            number = false,
            relativenumber = false,
            hybridnumber = false,
            signcolumn = false,
        },
        -- excluded_filetypes = {
        --     'toggleterm',
        --     'qf',
        --     'help',
        --     'NvimTree',
        --     'Trouble',
        --     'tsplayground',
        --     'Outline',
        -- },
    },
}
