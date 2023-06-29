return {
    {
        'cshuaimin/ssr.nvim',
        keys = {
            {
                '<leader>R',
                function()
                    require('ssr').open()
                end,
                mode = { 'n', 'x' },
                desc = 'Structural Replace',
            },
        },
    },
}
