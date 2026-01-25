return {
    'tadmccorkle/markdown.nvim',
    enabled = true,
    ft = 'markdown',
    opts = {},
    config = function()
        require('markdown').setup()
    end,
}
