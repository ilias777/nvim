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
                    map('n', '<leader>gn', function()
                        if vim.wo.diff then
                            return '<leader>gn'
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return '<Ignore>'
                    end, { expr = true, desc = 'Go to next git hunk' })

                    map('n', '<leader>gN', function()
                        if vim.wo.diff then
                            return '<leader>gN'
                        end
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return '<Ignore>'
                    end, { expr = true, desc = 'Go to previous git hunk' })

                    -- Actions
                    map('n', '<leader>gs', gs.stage_hunk, { desc = 'Stage Hunk' })
                    map('n', '<leader>gr', gs.reset_hunk, { desc = 'Reset Hunk' })
                    map('v', '<leader>gs', function()
                        gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end, { desc = 'Stage Hunk' })
                    map('v', '<leader>gr', function()
                        gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end, { desc = 'Reset Hunk' })
                    map('n', '<leader>gS', gs.stage_buffer, { desc = 'Stage Buffer' })
                    map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Undo Stage Buffer' })
                    map('n', '<leader>gR', gs.reset_buffer, { desc = 'Reset Buffer' })
                    map('n', '<leader>gp', gs.preview_hunk, { desc = 'Preview Hunk' })
                    map('n', '<leader>gB', function()
                        gs.blame_line({ full = true })
                    end, { desc = 'Blame line full' })
                    map('n', '<leader>gb', gs.toggle_current_line_blame, { desc = 'Toggle current blame line' })
                    map('n', '<leader>gd', gs.diffthis, { desc = 'Hunk Diffthis' })
                    map('n', '<leader>gD', function()
                        gs.diffthis('~')
                    end, { desc = 'Hunk Diffthis' })
                    map('n', '<leader>gt', gs.toggle_deleted, { desc = 'Git Toggle deleted lines' })

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
        config = true,
        opts = {
            disable_commit_confirmation = true,
            disable_builtin_notifications = true,
            integrations = {
                telescope = true,
                diffview = true,
            },
        },
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
