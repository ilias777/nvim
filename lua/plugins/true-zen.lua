return {
    'Pocco81/true-zen.nvim',
    enabled = false,
    cmd = { 'TZFocus', 'TZNarrow', 'TZAtaraxis', 'TZMinimalist' },
    keys = {
        { '<leader>z', '<cmd>TZAtaraxis<cr>', desc = 'Zen Mode' },
    },
    config = function()
        require('true-zen').setup({
            modes = {
                ataraxis = {
                    padding = {
                        left = 32,
                        right = 52,
                        top = 0,
                        bottom = 0,
                    },
                },
            },
        })
    end,
}
