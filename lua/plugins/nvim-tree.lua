return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    cmd = 'NvimTreeToggle',
    keys = {
        { '<Space>e', '<cmd>NvimTreeToggle<cr>', desc = 'File Browser' },
    },
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        -- Always open nvim-tree
        local function open_nvim_tree()
            require('nvim-tree.api').tree.open()
        end

        local function my_on_attach(bufnr)
            local api = require('nvim-tree.api')

            local function opts(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up Change Directory'))
            vim.keymap.set('n', '<C-d>', api.tree.change_root_to_node, opts('Change Root Directory'))
            vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        end

        require('nvim-tree').setup({
            on_attach = my_on_attach,
            hijack_cursor = true,
            view = {
                width = 45,
                side = 'right',
                float = {
                    enable = false,
                    quit_on_focus_loss = true,
                    open_win_config = {
                        relative = 'editor',
                        border = 'rounded',
                        width = 40,
                        height = 30,
                        row = 1,
                        col = 1,
                    },
                },
            },
            renderer = {
                indent_markers = {
                    enable = false,
                    icons = {
                        corner = '└ ',
                        edge = '│ ',
                        item = '│',
                        bottom = '─',
                        none = '  ',
                    },
                },
                icons = {
                    webdev_colors = true,
                    glyphs = {
                        default = '',
                        symlink = '',
                        bookmark = '',
                        modified = '●',
                        folder = {
                            arrow_closed = '',
                            arrow_open = '',
                            default = '',
                            open = '',
                            empty = '',
                            empty_open = '',
                            symlink = '',
                            symlink_open = '',
                        },
                    },
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = false,
                icons = {
                    hint = ' ',
                    info = ' ',
                    warning = ' ',
                    error = ' ',
                },
            },
            git = {
                enable = true,
                ignore = true,
                show_on_dirs = true,
                show_on_open_dirs = true,
                timeout = 400,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                    resize_window = true,
                },
            },
            trash = {
                cmd = 'trash',
                require_confirm = true,
            },
        })
        open_nvim_tree()
    end,
}
