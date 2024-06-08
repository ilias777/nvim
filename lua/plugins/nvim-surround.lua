return {
    'kylechui/nvim-surround',
    enabled = true,
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        move_cursor = 'sticky',
    },
    -- config = true,
}
