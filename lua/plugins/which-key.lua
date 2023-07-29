return {
    'folke/which-key.nvim',
    event = 'BufReadPre',
    enabled = true,
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
        local wk = require('which-key')
        wk.register({
            ['<leader>c'] = { name = '+Comment Frame/Box' }, -- Comment Frame & Comment Box
            ['<leader>d'] = { name = '+Debug' }, -- nvim-dap
            ['<leader>f'] = { name = '+File' }, -- Telescope
            ['<leader>g'] = { name = '+Git' }, -- Git
            ['<leader>h'] = { name = 'Hunk Gitsigns/Hop Motion' }, -- Hop
            ['<leader>t'] = { name = '+Toggle' }, -- Gitsigns
            ['<leader>x'] = { name = '+Trouble' }, -- Trouble
            ['<space>b'] = { name = '+Buffer' }, -- Bufferline.nvim
            ['<space>c'] = { name = '+Code actions / Cheatsheet' }, -- Code Actions with LSP
            ['<space>g'] = { name = '+Glance LSP' }, -- Glance LSP locations
            ['<space>n'] = { name = '+Noice' }, -- Noice.nvim
            ['<space>r'] = { name = '+Rename with LSP' }, -- Rename with LSP
            ['<space>w'] = { name = '+Workspace LSP' }, -- Workspace LSP
        })
    end,
    opts = {
        window = {
            border = 'rounded', -- none, single, double, shadow
            position = 'bottom', -- bottom, top
            margin = { 0, 10, 1, 10 }, -- extra window margin [top, right, bottom, left]
        },
        layout = {
            height = { min = 4, max = 15 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 2, -- spacing between columns
            align = 'center', -- align columns left, center or right
        },
    },
}
