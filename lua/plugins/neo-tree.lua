return {
    'nvim-neo-tree/neo-tree.nvim',
    enabled = true,
    branch = 'v3.x',
    event = 'VimEnter',
    keys = {
        {
            '<Space>e',
            function()
                require('neo-tree.command').execute({
                    toggle = true,
                    source = 'filesystem',
                    position = 'right',
                })
            end,
            desc = 'Filesystem (root dir)',
        },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    -- init = function()
    --     -- Auto-open on startup
    --     vim.api.nvim_create_autocmd('VimEnter', {
    --         command = 'Neotree right',
    --     })
    -- end,
    opts = {
        window = {
            mappings = {
                ['o'] = 'open',
                ['e'] = function()
                    vim.api.nvim_exec('Neotree focus filesystem right', true)
                end,
                ['b'] = function()
                    vim.api.nvim_exec('Neotree focus buffers right', true)
                end,
                ['g'] = function()
                    vim.api.nvim_exec('Neotree focus git_status right', true)
                end,
            },
        },
        filesystem = {
            follow_current_file = {
                enabled = true,
            },
        },
        default_component_configs = {
            indent = {
                with_markers = false,
            },
            git_status = {
                symbols = {
                    -- Status type
                    unstaged = '',
                },
            },
        },
        event_handlers = {
            {
                event = 'file_opened',
                handler = function(file_path)
                    require('neo-tree.command').execute({ action = 'close' })
                end,
            },
        },
    },
}
