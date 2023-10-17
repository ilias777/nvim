return {
    'rcarriga/nvim-notify',
    keys = {
        {
            '<space>nd',
            function()
                require('notify').dismiss({ silent = true, pending = true })
            end,
            desc = 'Dismiss all Notifications',
        },
    },
    opts = {
        render = 'compact',
        stages = 'slide',
    },
}
