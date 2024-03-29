return {
    'nvim-neo-tree/neo-tree.nvim',
    enabled = true,
    branch = 'v3.x',
    cmd = 'Neotree',
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
                ['h'] = function(state)
                    local node = state.tree:get_node()
                    if node.type == 'directory' and node:is_expanded() then
                        require('neo-tree.sources.filesystem').toggle_directory(state, node)
                    else
                        require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
                    end
                end,
                ['l'] = function(state)
                    local node = state.tree:get_node()
                    local path = node:get_id()
                    if node.type == 'directory' then
                        if not node:is_expanded() then
                            require('neo-tree.sources.filesystem').toggle_directory(state, node)
                        elseif node:has_children() then
                            require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
                        end
                    end
                    if node.type == 'file' then
                        require('neo-tree.utils').open_file(state, path)
                    end
                end,
                ['e'] = function()
                    vim.api.nvim_exec('Neotree focus filesystem right', true)
                end,
                ['b'] = function()
                    vim.api.nvim_exec('Neotree focus buffers right', true)
                end,
                ['g'] = function()
                    vim.api.nvim_exec('Neotree focus git_status right', true)
                end,
                ['O'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
                ['o'] = 'open',
            },
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
            },
            -- follow_current_file = {
            --     enabled = true,
            -- },
            window = {
                mappings = {
                    ['O'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
                },
            },
        },
        default_component_configs = {
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
