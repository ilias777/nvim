return {
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                         Diffview                         │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'sindrets/diffview.nvim',
        cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('diffview').setup()
        end,
    },
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                         Gitsigns                         │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPre',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('gitsigns').setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', '<leader>hn', function()
                        if vim.wo.diff then
                            return '<leader>hn'
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return '<Ignore>'
                    end, { expr = true, desc = 'Go to next hunk' })

                    map('n', '<leader>hN', function()
                        if vim.wo.diff then
                            return '<leader>hN'
                        end
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return '<Ignore>'
                    end, { expr = true, desc = 'Go to previous hunk' })

                    -- Actions
                    map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage Hunk' })
                    map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset Hunk' })
                    map('v', '<leader>hs', function()
                        gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end, { desc = 'Stage Hunk' })
                    map('v', '<leader>hr', function()
                        gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end, { desc = 'Reset Hunk' })
                    map('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage Buffer' })
                    map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo Stage Buffer' })
                    map('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset Buffer' })
                    map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview Hunk' })
                    map('n', '<leader>hb', function()
                        gs.blame_line({ full = true })
                    end, { desc = 'Blame line' })
                    map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Git Toggle current blame line' })
                    map('n', '<leader>hd', gs.diffthis, { desc = 'Hunk Diffthis' })
                    map('n', '<leader>hD', function()
                        gs.diffthis('~')
                    end, { desc = 'Hunk Diffthis' })
                    map('n', '<leader>td', gs.toggle_deleted, { desc = 'Git Toggle deleted lines' })

                    -- Text object
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end,
            })
        end,
    },
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                          Neogit                          │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'NeogitOrg/neogit',
        keys = {
            { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Neogit' },
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'sindrets/diffview.nvim',
        },
        config = function()
            require('neogit').setup({
                disable_commit_confirmation = true,
                integrations = {
                    diffview = true,
                },
            })
        end,
    },
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                    Advance git search                    │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'aaronhallaert/advanced-git-search.nvim',
        cmd = { 'AdvancedGitSearch' },
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
    },
}
