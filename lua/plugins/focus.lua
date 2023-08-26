return {
    'nvim-focus/focus.nvim',
    enabled = false,
    version = false,
    keys = {
        { '<space>h', '<cmd>FocusSplitLeft<CR>', desc = 'Focus Split Left' },
        { '<space>j', '<cmd>FocusSplitDown<CR>', desc = 'Focus Split Down' },
        { '<space>k', '<cmd>FocusSplitUp<CR>', desc = 'Focus Split Up' },
        { '<space>l', '<cmd>FocusSplitRight<CR>', desc = 'Focus Split Right' },
        { '<space>m', '<cmd>FocusMaxOrEqual<CR>', desc = 'Maximaze or Equalises Split' },
    },
    init = function()
        local ignore_filetypes = { 'neo-tree', 'Trouble' }
        local ignore_buftypes = { 'nofile', 'prompt', 'popup' }

        local augroup = vim.api.nvim_create_augroup('FocusDisable', { clear = true })

        vim.api.nvim_create_autocmd('WinEnter', {
            group = augroup,
            callback = function(_)
                if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
                    vim.w.focus_disable = true
                else
                    vim.w.focus_disable = false
                end
            end,
            desc = 'Disable focus autoresize for BufType',
        })

        vim.api.nvim_create_autocmd('FileType', {
            group = augroup,
            callback = function(_)
                if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
                    vim.w.focus_disable = true
                else
                    vim.w.focus_disable = false
                end
            end,
            desc = 'Disable focus autoresize for FileType',
        })
    end,
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
