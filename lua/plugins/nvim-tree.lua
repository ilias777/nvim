return {
    'nvim-tree/nvim-tree.lua',
    enabled = false,
    version = '*',
    lazy = false,
    cmd = 'NvimTreeToggle',
    keys = {
        { '<Space>e', '<cmd>NvimTreeToggle<cr>', desc = 'File Browser' },
    },
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        -- Always open nvim-tree
        -- local function open_nvim_tree()
        --     require('nvim-tree.api').tree.open()
        -- end

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
                centralize_selection = true,
                side = 'right',
                width = 45,
                -- float = {
                --     enable = false,
                --     quit_on_focus_loss = true,
                --     open_win_config = {
                --         relative = 'editor',
                --         border = 'rounded',
                --         width = 40,
                --         height = 30,
                --         row = 1,
                --         col = 1,
                --     },
                -- },
            },
            renderer = {
                highlight_git = true,
                icons = {
                    git_placement = 'after',
                    show = {
                        folder_arrow = false,
                    },
                    glyphs = {
                        folder = {
                            default = '',
                            open = '',
                            empty = '',
                            empty_open = '',
                        },
                    },
                },
            },
            diagnostics = {
                enable = true,
            },
            modified = {
                enable = true,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        })
        -- open_nvim_tree()
    end,
}
