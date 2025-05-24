return {
    'lukas-reineke/indent-blankline.nvim',
    enabled = true,
    event = { 'BufReadPre', 'BufNewFile' },
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
