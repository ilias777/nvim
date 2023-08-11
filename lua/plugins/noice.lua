return {
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        opts = {
            messages = {
                view_history = 'notify',
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
            },
            routes = {
                {
                    view = 'mini',
                    filter = {
                        event = 'msg_show',
                        kind = '',
                        find = 'geschrieben',
                    },
                },
                {
                    view = 'mini',
                    filter = {
                        event = {
                            'msg_showmode',
                            -- 'msg_showcmd',
                        },
                    },
                },
            },
        },
    },
    {
        'rcarriga/nvim-notify',
        event = 'VeryLazy',
        opts = {
            render = 'compact',
            stages = 'slide',
        },
    },
}
