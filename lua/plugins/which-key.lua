return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    enabled = true,
    opts = {
        preset = 'helix',
        sort = { 'manual', 'group', 'lower' },
        expand = 0,
        spec = {
            {
                mode = { 'n', 'v' },
                { 'gr', group = '+LSP Functions' },
                { 'grw', group = '+LSP Workspace Folders' },
                { '<leader>c', group = '+Comment-Box / Context Treesitter' }, -- Comment Box
                { '<leader>d', group = '+Diffview / Debug' }, -- Diffview & nvim-dap
                { '<leader>ds', group = '+Dap Step' }, -- nvim-dap step
                { '<leader>f', group = '+File' }, -- Telescope
                { '<leader>g', group = '+Git' }, -- Git
                { '<leader>h', group = '+Hop Motion' }, -- Hop
                { '<leader>l', group = '+Lazy / LTeX' }, -- Lazy & LTeX
                { '<leader>m', group = '+Show Messages' }, -- Messages
                { '<leader>t', group = '+ToggleTerm / Todo Comments' }, -- ToggleTerm & Todo Comments
                { '<space>b', group = '+Buffer' }, -- Bufferline.nvim
                { '<space>g', group = '+Glance LSP' }, -- Glance LSP locations
                { '<space>i', group = '+IncRename / Inlay Hints' }, -- IncRename
                { '<space>n', group = '+Noice' }, -- Noice.nvim
                { '<Space>r', group = '+Lsp Rename' }, -- Rename with LSP
                { '<space>x', group = '+Trouble' }, -- Trouble.nvim
            },
        },
    },
    config = function(_, opts)
        local wk = require('which-key')
        wk.setup(opts)
        wk.add(opts.spec)
    end,
}
