return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
    config = function()
        require('noice').setup({
            cmdline = {
                format = {
                    search_down = {
                        view = 'cmdline',
                    },
                    search_up = {
                        view = 'cmdline',
                    },
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
                signature = {
                    enabled = false,
                },
                hover = {
                    enabled = false,
                },
            },
            views = {
                cmdline_popup = {
                    border = {
                        style = 'none',
                        padding = { 1, 3 },
                    },
                    win_options = {
                        winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
                    },
                    position = {
                        row = 3,
                        col = '50%',
                    },
                },
            },
            mini = {
                win_options = {
                    -- winhighlight = {
                    --     Normal = 'NormalFloat',
                    --     FloatBorder = 'FloatBorder',
                    -- },
                    winblend = 0,
                },
            },
            routes = {
                {
                    view = 'mini',
                    filter = {
                        -- event = {
                        --     'msg_showmode',
                        --     -- 'msg_showcmd',
                        -- },
                        event = 'msg_show',
                        kind = '',
                        find = 'geschrieben',
                    },
                },
                -- {
                --     view = 'mini',
                --     filter = {
                --         event = {
                --             'msg_showmode',
                --             -- 'msg_showcmd',
                --         },
                --     },
                -- },
            },
        })
    end,
}
