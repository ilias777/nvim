return {
    'folke/flash.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        label = {
            uppercase = false,
            rainbow = {
                enabled = true,
                shade = 5,
            },
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
            treesitter = {
                highlight = {
                    backdrop = true,
                },
            },
        },
        -- action = function(match, state)
        --     require('cinnamon').scroll(function()
        --         require('flash.jump').jump(match, state)
        --         require('flash.jump').on_jump(state)
        --     end)
        -- end,
    },
    keys = {
        {
            's',
            mode = { 'n', 'x', 'o' },
            function()
                require('flash').jump()
            end,
            desc = 'Flash',
        },
        {
            'S',
            mode = { 'n', 'o' },
            function()
                require('flash').treesitter()
            end,
            desc = 'Flash Treesitter',
        },
        {
            'r',
            mode = 'o',
            function()
                require('flash').remote()
            end,
            desc = 'Remote Flash',
        },
        {
            'R',
            mode = { 'o', 'x' },
            function()
                require('flash').treesitter_search()
            end,
            desc = 'Treesitter Flash Search',
        },
        {
            '<c-s>',
            mode = { 'c' },
            function()
                require('flash').toggle()
            end,
            desc = 'Toggle Flash Search',
        },
        vim.keymap.set('n', '<leader>s', function()
            require('flash').jump({
                pattern = '.',
                label = { min_pattern_length = 2 },
                search = {
                    mode = function(pattern)
                        if pattern:sub(1, 1) == '.' then
                            pattern = pattern:sub(2)
                        end
                        return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
                    end,
                },
                jump = { pos = 'range' },
            })
        end, { desc = 'Flash: jump to word' }),
    },
}
