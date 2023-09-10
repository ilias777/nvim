return {
    'nvim-neo-tree/neo-tree.nvim',
    enabled = false,
    branch = 'v3.x',
    lazy = false,
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
    -- config = function()
    --     -- Auto-open on startup
    --     -- vim.api.nvim_create_autocmd('VimEnter', {
    --     --     command = 'Neotree right',
    --     -- })
    --
    --     -- Open neo-tree if nvim has no arguments
    --     -- if vim.fn.argc() == 0 then
    --     --     vim.api.nvim_create_autocmd('UiEnter', {
    --     --         callback = function()
    --     --             -- vim.cmd('Neotree focus filesystem right')
    --     --             vim.api.nvim_exec('Neotree focus filesystem right', true)
    --     --         end,
    --     --     })
    --     -- end
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
            icon = {
                folder_closed = '',
                folder_open = '',
                folder_empty = '',
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
