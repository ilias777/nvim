return {
    'karb94/neoscroll.nvim',
    enabled = false,
    keys = {
        { '<C-u>' },
        { '<C-d>' },
        { '<C-b>' },
        { '<C-f>' },
        { '<C-y>' },
        { '<C-e>' },
        { 'zt' },
        { 'ze' },
        { 'zb' },
    },
    config = function()
        -- quadratic | cubic | quartic | quintic | circular | sine
        require('neoscroll').setup({
            easing_function = 'cubic',
        })
    end,
}
