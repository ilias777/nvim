return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
        modes = {
            char = {
                keys = { 'f', 'F', 't', 'T' },
            },
        },
    },
    keys = {
        {
            's',
            mode = { 'n', 'x', 'o' },
            function()
                -- default options: exact mode, multi window, all directions, with a backdrop
                require('flash').jump()
            end,
        },
        {
            'S',
            mode = { 'n', 'o', 'x' },
            function()
                require('flash').treesitter()
            end,
        },
    },
}
