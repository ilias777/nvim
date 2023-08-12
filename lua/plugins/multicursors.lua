return {
    'smoka7/multicursors.nvim',
    enabled = true,
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
    opts = function()
        local N = require('multicursors.normal_mode')
        local I = require('multicursors.insert_mode')
        return {
            normal_keys = {
                -- to change default lhs of key mapping change the key
                [','] = {
                    -- assigning nil to method exits from multi cursor mode
                    method = N.clear_others,
                    -- description to show in hint window
                    desc = 'Clear others',
                },
            },
            insert_keys = {
                -- to change default lhs of key mapping change the key
                ['<CR>'] = {
                    -- assigning nil to method exits from multi cursor mode
                    method = I.Cr_method,
                    -- description to show in hint window
                    desc = 'New line',
                },
            },
        }
    end,
    config = function()
        require('multicursors').setup({
            hint_config = {
                border = 'rounded',
                position = 'top',
            },
        })
    end,
    -- init = function()
    --     local colors = require('catppuccin.palettes').get_palette('mocha')
    --     vim.api.nvim_set_hl(0, 'MultiCursor', { fg = colors.maroon, bg = colors.crust })
    --     vim.api.nvim_set_hl(0, 'MultiCursorMain', { fg = colors.crust, bg = colors.maroon, bold = true })
    --     vim.api.nvim_set_hl(0, 'MultiCursor', { fg = '#11111b', bg = '#74c7ec' })
    --     vim.api.nvim_set_hl(0, 'MultiCursorMain', { fg = '#11111b', bg = '#eba0ac', bold = true })
    --     vim.cmd([[ hi MultiCursor guibg=#74c7ec guifg=#11111b ]])
    --     vim.cmd([[ hi MultiCursorMain guibg=#eba0ac guifg=#11111b ]])
    -- end,
}
