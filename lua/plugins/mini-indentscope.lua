return {
    'echasnovski/mini.indentscope',
    enabled = true,
    event = 'BufReadPre',
    version = false,
    init = function()
        local colors = require('catppuccin.palettes').get_palette('mocha')
        vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { fg = colors.sapphire })
        vim.api.nvim_create_autocmd('FileType', {
            pattern = {
                'checkhealth',
                'comment-box',
                'fzf',
                'glowpreview',
                'grug-far-help',
                'help',
                'lazy',
                'lspinfo',
                'markdown',
                'mason',
                'neo-tree',
                'NeogitPopup',
                'NeogitStatus',
                'noice',
                'notify',
                'oil',
                'oil_preview',
                'Outline',
                'toggleterm',
                'Trouble',
                'typst',
            },
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
        })
    end,
    opts = {
        options = { try_as_border = true },
        symbol = '│',
    },
}
