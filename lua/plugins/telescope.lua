return {
    'nvim-telescope/telescope.nvim',
    cmd = { 'Telescope' },
    keys = {
        { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find Buffers' },
        { '<leader>fc', ":lua require'telescope.builtin'.commands{}<cr>", desc = 'List Commands' },
        { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Find Diagnostics' },
        { '<leader>fe', '<cmd>Telescope file_browser<cr>', desc = 'File Browser' },
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Find Word' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Find Help' },
        { '<leader>fi', '<cmd>Telescope import<cr>', desc = 'Find Imports' },
        { '<leader>fj', '<cmd>Telescope emoji<cr>', desc = 'Find emoji' },
        { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Find Keymaps' },
        { '<leader>fl', '<cmd>Telescope highlights<cr>', desc = 'Find Highlights' },
        { '<leader>fm', '<cmd>Telescope heading<cr>', desc = 'Find Heading' },
        { '<leader>fo', '<cmd>Telescope oldfiles<cr>', desc = 'Recently opened files' },
        { '<leader>fp', '<cmd>Telescope spell_suggest<cr>', desc = 'Find Spell Suggest' },
        { '<leader>fq', '<cmd>Telescope quickfix<cr>', desc = 'Find Quickix' },
        { '<leader>fr', '<cmd>Telescope grep_string<cr>', desc = 'Find Word Under Cursor' },
        { '<leader>fs', '<cmd>Telescope symbols<cr>', desc = 'Find Symbols' },
        { '<leader>ft', '<cmd>Telescope git_files<cr>', desc = 'Find Git Files' },
        { '<leader>fu', '<cmd>Telescope undo<cr>', desc = 'Find Undo' },
        { '<leader>fy', '<cmd>Telescope yank_history<cr>', mode = { 'n', 'x' }, desc = 'Find yanks' },
        { '<leader>fz', '<cmd>Telescope zoxide list<cr>', desc = 'Find Directory' },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-symbols.nvim',
        'xiyaowong/telescope-emoji.nvim',
        'debugloop/telescope-undo.nvim',
        'jvgrootveld/telescope-zoxide',
        'piersolenski/telescope-import.nvim',
        'crispgm/telescope-heading.nvim',
    },
    config = function()
        local actions = require('telescope.actions')
        local action_layout = require('telescope.actions.layout')
        local fb_actions = require('telescope').extensions.file_browser.actions
        local open_with_trouble = require('trouble.sources.telescope').open

        require('telescope').setup({
            defaults = {
                prompt_prefix = '   ',
                selection_caret = '▎ ',
                multi_icon = ' │ ',
                winblend = 0,
                borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
                mappings = {
                    i = {
                        ['<c-t>'] = open_with_trouble,
                        ['<M-p>'] = action_layout.toggle_preview,
                        ['<S-down>'] = actions.preview_scrolling_down,
                        ['<S-up>'] = actions.preview_scrolling_up,
                    },
                    n = {
                        ['<c-t>'] = open_with_trouble,
                        ['q'] = require('telescope.actions').close,
                        ['<M-p>'] = action_layout.toggle_preview,
                        ['<S-down>'] = actions.preview_scrolling_down,
                        ['<S-up>'] = actions.preview_scrolling_up,
                    },
                },
                -- preview = {
                --     hide_on_startup = true,
                -- },
                file_ignore_patterns = {
                    'node_modules',
                },
            },
            pickers = {
                buffers = {
                    previewer = false,
                    theme = 'dropdown',
                    mappings = {
                        n = {
                            ['<C-e>'] = 'delete_buffer',
                            ['l'] = 'select_default',
                        },
                    },
                    initial_mode = 'normal',
                },
                find_files = {
                    -- theme = 'ivy', -- 'ivy', 'dropdown', 'cursor'
                    -- layout_strategy = 'vertical',
                    -- layout_config = { height = 0.9 },
                    -- previewer = false,
                    path_display = { 'smart' },
                    layout_config = {
                        prompt_position = 'top',
                        preview_width = 0.5,
                        -- width = 0.7,
                    },
                    sorting_strategy = 'ascending',
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
                grep_string = {
                    initial_mode = 'normal',
                    theme = 'ivy',
                },
                live_grep = {
                    theme = 'ivy',
                },
            },
            extensions = {
                file_browser = {
                    dir_icon = '',
                    prompt_path = true,
                    grouped = true,
                    theme = 'dropdown',
                    initial_mode = 'normal',
                    previewer = false,
                    mappings = {
                        n = {
                            ['o'] = 'select_default',
                            ['H'] = fb_actions.toggle_hidden,
                            ['h'] = fb_actions.goto_parent_dir,
                            ['l'] = 'select_default',
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
                heading = {
                    treesitter = true,
                },
                advanced_git_search = {
                    diff_plugin = 'diffview',
                },
            },
        })

        -- Extensions
        require('telescope').load_extension('emoji')
        require('telescope').load_extension('file_browser')
        require('telescope').load_extension('undo')
        require('telescope').load_extension('advanced_git_search')
        require('telescope').load_extension('zoxide')
        require('telescope').load_extension('import')
        require('telescope').load_extension('heading')
        require('telescope').load_extension('yank_history')
        -- require('telescope').load_extension('neoclip')
        -- require('telescope').load_extension('noice')
    end,
}
