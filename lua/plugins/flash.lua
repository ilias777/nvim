return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
        label = {
            reuse = 'all', ---@type "lowercase" | "all"
        },
        modes = {
            char = {
                jump_labels = true,
                keys = { 'f', 'F', 't', 'T' },
                char_actions = function(motion)
                    return {
                        [','] = 'next', -- set to `right` to always go right
                        [';'] = 'prev', -- set to `left` to always go left
                        -- clever-f style
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
            '<Space>v',
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
