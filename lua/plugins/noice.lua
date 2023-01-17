return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
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
                -- {
                --     view = 'mini',
                --     filter = {
                --         event = {
                --             'msg_showmode',
                --             -- 'msg_showcmd',
                --         },
                --     },
                -- },
                -- {
                --     filter = {
                --         event = 'msg_showmode',
                --         kind = '',
                --         find = 'visuell',
                --     },
                --     opts = { skip = true },
                -- },
            },
        })
    end,
}
