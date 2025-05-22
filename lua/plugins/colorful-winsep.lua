return {
    'nvim-zh/colorful-winsep.nvim',
    enabled = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        only_line_seq = false,
    },
}
