return {
    'nvim-treesitter/nvim-treesitter-context',
    enabled = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        max_lines = '10%',
    },
}
