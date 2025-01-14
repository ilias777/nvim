return {
    'aaronik/treewalker.nvim',
    -- The following options are the defaults.
    -- Treewalker aims for sane defaults, so these are each individually optional,
    -- and setup() does not need to be called, so the whole opts block is optional as well.
    keys = {
        { '<M-k>', '<cmd>Treewalker Up<cr>', mode = { 'n', 'v' }, desc = 'Treewalker Up' },
        { '<M-j>', '<cmd>Treewalker Down<cr>', mode = { 'n', 'v' }, desc = 'Treewalker Down' },
        { '<M-h>', '<cmd>Treewalker Left<cr>', mode = { 'n', 'v' }, desc = 'Treewalker Left' },
        { '<M-l>', '<cmd>Treewalker Right<cr>', mode = { 'n', 'v' }, desc = 'Treewalker Right' },
        { '<M-S-k>', '<cmd>Treewalker SwapDown<cr>', desc = 'Treewalker Swap Up' },
        { '<M-S-j>', '<cmd>Treewalker SwapUp<cr>', desc = 'Treewalker Swap Up' },
        { '<M-S-h>', '<cmd>Treewalker SwapLeft<cr>', desc = 'Treewalker Swap Left' },
        { '<M-S-l>', '<cmd>Treewalker SwapRight<cr>', desc = 'Treewalker Swap Right' },
    },
    opts = {
        -- Whether to briefly highlight the node after jumping to it
        highlight = true,

        -- How long should above highlight last (in ms)
        highlight_duration = 250,

        -- The color of the above highlight. Must be a valid vim highlight group.
        -- (see :h highlight-group for options)
        highlight_group = 'CursorLine',
    },
}
