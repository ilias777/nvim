return {
    'stevearc/aerial.nvim',
    enabled = true,
    cmd = 'AerialToggle',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        layout = {
            width = 60,
        },
    },
}
