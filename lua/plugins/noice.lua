return {
    {
        'folke/noice.nvim',
        keys = {
            { ':' },
        },
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
            'j-hui/fidget.nvim',
        },
        config = function()
            require('noice').setup({
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
                        enabled = true,
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
                        position = {
                            row = 5,
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
                            event = {
                                'msg_showmode',
                                -- 'msg_showcmd',
                            },
                        },
                    },
                },
            })
        end,
    },
    {
        'j-hui/fidget.nvim',
        lazy = true,
        config = function()
            require('fidget').setup()
        end,
    },
}
