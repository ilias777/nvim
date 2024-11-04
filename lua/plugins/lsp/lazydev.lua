return {
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        dependencies = {
            { 'justinsgithub/wezterm-types', lazy = true },
            { 'Bilal2453/luvit-meta', lazy = true },
        },
        opts = {
            library = {
                'lazy.nvim',
                'luvit-meta/library',
                { path = 'wezterm-types', mods = { 'wezterm' } },
            },
        },
    },
}
