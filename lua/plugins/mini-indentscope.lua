return {
    'echasnovski/mini.indentscope',
    enabled = true,
    event = 'BufReadPre',
    version = false,
    init = function()
        local colors = require('catppuccin.palettes').get_palette('mocha')
        vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { fg = colors.sapphire })
    end,
    opts = {
        options = { try_as_border = true },
        symbol = '│',
    },
}
