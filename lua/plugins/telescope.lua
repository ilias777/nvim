return {
    'nvim-telescope/telescope.nvim',
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
        { '<leader>fe', '<cmd>Telescope file_browser<cr>', desc = 'File Browser' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Find Word' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Find Help' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find Buffers' },
        { '<leader>fu', '<cmd>Telescope undo<cr>', desc = 'Find Undo' },
        { '<leader>fl', '<cmd>Telescope highlights<cr>', desc = 'Find Highlights' },
        { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Find Keymaps' },
        { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Find Diagnostics' },
    },
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-symbols.nvim',
        'xiyaowong/telescope-emoji.nvim',
        'debugloop/telescope-undo.nvim',
    },
    config = function()
        local trouble = require('trouble.providers.telescope')
        local fb_actions = require('telescope').extensions.file_browser.actions

        require('telescope').setup({
            defaults = {
                prompt_prefix = '   ',
                winblend = 0,
                mappings = {
                    i = { ['<c-t>'] = trouble.open_with_trouble },
                    n = {
                        ['<c-t>'] = trouble.open_with_trouble,
                        ['q'] = require('telescope.actions').close,
                    },
                },
            },
            pickers = {
                buffers = {
                    theme = 'dropdown',
                    mappings = {
                        n = { ['<C-e>'] = 'delete_buffer' },
                    },
                    initial_mode = 'normal',
                },
                find_files = {
                    theme = 'ivy', -- 'ivy', 'dropdown', 'cursor'
                    -- layout_strategy = 'vertical',
                    -- layout_config = { height = 0.9 },
                },
                help_tags = {
                    theme = 'ivy',
                },
                symbols = {
                    theme = 'dropdown',
                },
                registers = {
                    theme = 'ivy',
                },
            },
            extensions = {
                file_browser = {
                    theme = 'ivy',
                    initial_mode = 'normal',
                    mappings = {
                        ['n'] = {
                            -- ['o'] = fb_actions.select_default,
                        },
                    },
                },
                undo = {
                    initial_mode = 'normal',
                    use_delta = true,
                    side_by_side = true,
                    layout_strategy = 'vertical',
                    layout_config = {
                        preview_height = 0.8,
                    },
                },
                -- heading = {
                --    treesitter = true,
                -- },
                advanced_git_search = {
                    diff_plugin = 'diffview',
                    git_flags = {},
                },
            },
        })

        -- Extensions
        require('telescope').load_extension('emoji')
        require('telescope').load_extension('file_browser')
        require('telescope').load_extension('undo')
        require('telescope').load_extension('advanced_git_search')
        require('telescope').load_extension('yank_history')
        -- require('telescope').load_extension('heading')
        -- require('telescope').load_extension('neoclip')
        -- require('telescope').load_extension('noice')
    end,
}
