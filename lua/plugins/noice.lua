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
                signature = {
                    enabled = false,
                },
                hover = {
                    enabled = false,
                },
            },
            views = {
                cmdline_popup = {
                    -- border = {
                    --     style = 'none',
                    --     style = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
                    --     padding = { 1, 3 },
                    -- },
                    -- win_options = {
                    --     winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
                    -- },
                    position = {
                        row = 3,
                        col = '50%',
                    },
                },
            },
            presets = {
                inc_rename = true,
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
