return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.x',
    dependencies = 'nvim-lua/plenary.nvim',
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
                buffers = {
                    -- theme = 'ivy'
                },
                registers = {
                    theme = 'ivy',
                },
            },
            extensions = {
                file_browser = {
                    theme = 'ivy',
                    mappings = {
                        ['n'] = {
                            -- ['o'] = fb_actions.goto_cwd
                        },
                    },
                },
                -- heading = {
                --    treesitter = true,
                -- },
            },
        })

        require('telescope').load_extension('emoji')
        require('telescope').load_extension('file_browser')
        -- require('telescope').load_extension('heading')
        -- require('telescope').load_extension('neoclip')
        -- require('telescope').load_extension('noice')
    end,
}
