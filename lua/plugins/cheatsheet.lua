return {
    'sudormrfbin/cheatsheet.nvim',
    enabled = false,
    keys = {
        { '<space>cs', '<cmd>Cheatsheet<cr>', desc = 'Cheatsheet' },
        { '<space>ce', '<cmd>CheatsheetEdit<cr>', desc = 'Cheatsheet Edit' },
    },
    dependencies = {
        { 'nvim-telescope/telescope.nvim' },
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
    },
    opts = {
        bundled_plugin_cheatsheets = {
            disabled = { 'gitsigns.nvim' },
        },
    },
}
