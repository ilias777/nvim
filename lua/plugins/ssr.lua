return {
    {
        'cshuaimin/ssr.nvim',
        keys = {
            {
                '<leader>r',
                function()
                    require('ssr').open()
                end,
                mode = { 'n', 'x' },
                desc = 'Structural Replace',
            },
        },
    },
}
