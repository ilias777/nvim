return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
        label = {
            ---@type "lowercase" | "all"
            reuse = 'all',
        },
        modes = {
            search = {
                enabled = true,
                highlight = { backdrop = true },
            },
            char = {
                jump_labels = true,
                keys = { 'f', 'F', 't', 'T' },
                char_actions = function(motion)
                    return {
                        [','] = 'next',
                        [';'] = 'prev',
                        [motion:lower()] = 'next',
                        [motion:upper()] = 'prev',
                    }
                end,
            },
        },
    },
    keys = {
        {
            's',
            mode = { 'n', 'x', 'o' },
            function()
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
                require('flash').remote()
            end,
            desc = 'Remote Flash',
        },
        {
            '<Space>v',
            mode = { 'n', 'o', 'x' },
            function()
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
