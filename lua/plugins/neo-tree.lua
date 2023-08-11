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
            desc = 'Buffers (root dir)',
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
        filesystem = {
            window = {
                mappings = {
                    ['o'] = {
                        command = 'open',
                        nowait = true,
                    },
                },
            },
        },
        default_component_configs = {
            indent = {
                with_markers = false,
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
