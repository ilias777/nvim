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
        -- {
        --     'S',
        --     mode = { 'n', 'o', 'x' },
        --     function()
        --         require('flash').treesitter()
        --     end,
        -- },
        {
            'r',
            mode = 'o',
            function()
                -- jump to a remote location to execute the operator
                require('flash').remote()
            end,
            desc = 'Remote Flash',
        },
        {
            'R',
            mode = { 'n', 'o', 'x' },
            function()
                -- show labeled treesitter nodes around the search matches
                require('flash').treesitter_search()
            end,
            desc = 'Treesitter Search',
        },
        {
            '<c-s>',
            mode = { 'c' },
            function()
                require('flash').toggle()
            end,
            desc = 'Toggle Flash Search',
        },
    },
}
