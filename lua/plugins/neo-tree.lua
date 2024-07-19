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
            desc = 'Neotree Filesystem',
        },
        {
            '<Leader>e',
            function()
                require('neo-tree.command').execute({
                    toggle = true,
                    source = 'filesystem',
                    position = 'float',
                })
            end,
            desc = 'Neotree Float Filesystem',
        },
        {
            '<Space>bb',
            function()
                require('neo-tree.command').execute({
                    toggle = true,
                    source = 'buffers',
                    position = 'float',
                })
            end,
            desc = 'Neotree Float Buffers',
        },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    opts = {
        popup_border_style = 'single',
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
            diagnostics = {
                symbols = {
                    hint = '󰌶',
                    info = '',
                    warn = '',
                    error = '',
                },
            },
        },
        commands = {
            image_wezterm = function(state)
                local node = state.tree:get_node()
                if node.type == 'file' then
                    require('image_preview').PreviewImage(node.path)
                end
            end,
        },
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
                ['E'] = function()
                    vim.api.nvim_exec2('Neotree focus filesystem right', { output = true })
                end,
                ['B'] = function()
                    vim.api.nvim_exec2('Neotree focus buffers right', { output = true })
                end,
                ['G'] = function()
                    vim.api.nvim_exec2('Neotree focus git_status right', { output = true })
                end,
                ['O'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
                ['o'] = 'open',
                ['<leader>p'] = 'image_wezterm',
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
