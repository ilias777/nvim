return {
    'gorbit99/codewindow.nvim',
    enabled = true,
    keys = {
        { '<leader>mm' },
        { '<leader>mc' },
        { '<leader>mf' },
        { '<leader>mo' },
    },
    config = function()
        local codewindow = require('codewindow')
        codewindow.setup({
            z_index = 20,
        })
        codewindow.apply_default_keybinds()
        vim.api.nvim_set_hl(0, 'CodewindowBorder', { link = 'FloatBorder' })
    end,
}
