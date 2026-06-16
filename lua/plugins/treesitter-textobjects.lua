return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    enabled = true,
    branch = 'main',
    event = { 'BufReadPre', 'BufNewFile' },
    init = function()
        vim.g.no_plugin_maps = true
    end,
    opts = {},
}
