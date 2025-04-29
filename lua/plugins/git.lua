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
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('gitsigns').setup({
                preview_config = {
                    border = 'single',
                },
                attach_to_untracked = true,
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', '<leader>gn', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '<leader>gn', bang = true })
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end)

                    map('n', '<leader>gN', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '<leader>gN', bang = true })
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end)

                    -- Actions
                    map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Gitsigns Stage Hunk' })
                    map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Gitsigns Reset Hunk' })

                    map('v', '<leader>gs', function()
                        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end, { desc = 'Gitsigns Stage Hunk' })

                    map('v', '<leader>gr', function()
                        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end, { desc = 'Gitsigns Reset Hunk' })

                    map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Gitsigns Stage Buffer' })
                    map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Gitsigns Reset Buffer' })
                    map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Gitsigns Preview Hunk' })
                    map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = 'Gitsigns Preview Hunk Inline' })

                    map('n', '<leader>gB', function()
                        gitsigns.blame_line({ full = true })
                    end, { desc = 'Gitsigns Blame Line Full' })

                    map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Gitsigns Hunk Diffthis' })

                    map('n', '<leader>gD', function()
                        gitsigns.diffthis('~')
                    end, { desc = 'Gitsigns Hunk Diffthis' })

                    -- Toggles
                    map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = 'Gitsigns Current Blame Line' })
                    map('n', '<leader>gt', gitsigns.toggle_deleted, { desc = 'Gitsigns Git Toggle deleted lines' })
                    map('n', '<leader>gw', gitsigns.toggle_word_diff, { desc = 'Gitsigns Git Toggle word diff' })

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
        cmd = 'Neogit',
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
            graph_style = 'kitty',
            notification_icon = '',
            commit_editor = {
                staged_diff_split_kind = 'vsplit',
                spell_check = false,
            },
            signs = {
                item = { '', '' },
                section = { '', '' },
            },
            disable_commit_confirmation = true,
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
