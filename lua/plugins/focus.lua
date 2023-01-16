return {
    'beauwilliams/focus.nvim',
    config = function()
        require('focus').setup({
            enable = true,
            autoresize = false,
            number = false,
            relativenumber = false,
            hybridnumber = false,
            signcolumn = false,
            excluded_filetypes = {
                'toggleterm',
                'qf',
                'help',
                'NvimTree',
                'Trouble',
                'tsplayground',
                'Outline',
            },
            cursorline = false,
            winhighlight = false,
        })
    end,
}
