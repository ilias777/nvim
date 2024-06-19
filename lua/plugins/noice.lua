return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
        cmdline = {
            format = {
                search_replace = { kind = 'search', pattern = '^:%%s/', icon = '󰛔', lang = 'regex' },
            },
        },
        messages = {
            view_history = 'popup',
        },
        commands = {
            history = {
                view = 'popup',
            },
        },
        lsp = {
            progress = {
                enabled = false,
            },
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_markdown'] = true,
            },
            signature = {
                enabled = false,
            },
        },
        presets = {
            inc_rename = true,
        },
        views = {
            cmdline_popup = {
                position = {
                    row = 3,
                    col = '50%',
                },
            },
            popup = {
                size = {
                    width = '80%',
                    height = '70%',
                },
                border = {
                    style = 'single',
                },
                win_options = {
                    wrap = true,
                },
            },
        },
        routes = {
            -- ╭───────────────────────╮
            -- │ SEND MESSAGES TO MINI │
            -- ╰───────────────────────╯
            {
                view = 'mini',
                filter = {
                    event = 'msg_show',
                    any = {
                        { find = '; after #%d+' },
                        { find = '; before #%d+' },
                        { find = 'fewer lines' },
                        { find = 'written' },
                    },
                },
            },
            -- {
            --     view = 'mini',
            --     filter = {
            --         event = 'msg_showcmd',
            --     },
            -- },
            {
                view = 'mini',
                filter = {
                    event = 'notify',
                    any = {
                        { find = 'hidden' },
                        { find = 'clipboard' },
                        { find = 'Deleted' },
                        { find = 'Renamed' },
                        { find = 'file_browser' },
                    },
                },
            },
            -- ╭───────────────╮
            -- │ SKIP MESSAGES │
            -- ╰───────────────╯
            {
                filter = {
                    event = 'msg_show',
                    kind = '',
                    any = {
                        { find = 'catalog' },
                    },
                },
                opts = { skip = true },
            },
            -- {
            --     filter = {
            --         event = 'notify',
            --         kind = 'info',
            --         any = {
            --             { find = 'hidden' },
            --         },
            --     },
            --     opts = { skip = true },
            -- },
        },
    },
}
