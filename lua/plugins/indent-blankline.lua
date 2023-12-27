return {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    main = 'ibl',
    opts = {
        indent = {
            char = '│',
            repeat_linebreak = false,
        },
        scope = {
            enabled = false,
        },
    },
}
