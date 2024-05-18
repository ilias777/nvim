return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
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
            hover = {
                enabled = false,
            },
            signature = {
                enabled = false,
            },
            documentation = {
                enabled = false,
                opts = {
                    border = { style = 'rounded' },
                    relative = 'cursor',
                    position = {
                        row = 2,
                    },
                    winhighlight = {
                        Normal = 'LspFloat',
                        FloatBorder = 'LspFloatBorder',
                    },
                },
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
        },
    },
}
