return {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
        library = {
            vim.env.LAZY .. '/luvit-meta/library', -- see below
            -- You can also add plugins you always want to have loaded.
            -- Useful if the plugin has globals or types you want to use
            -- vim.env.LAZY .. "/LazyVim", -- see below
        },
    },
}
