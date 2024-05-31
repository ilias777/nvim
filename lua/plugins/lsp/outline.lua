return {
    'hedyhli/outline.nvim',
    enabled = true,
    cmd = 'Outline',
    keys = {
        { '<space>o', '<cmd>Outline<cr>', desc = 'Toggle Outline' },
    },
    opts = {
        outline_window = {
            width = 30,
        },
        symbols = {
            icons = {
                Module = { icon = '全' },
                Namespace = { icon = '' },
                Package = { icon = '' },
                Class = { icon = '' },
                Method = { icon = '' },
                Enum = { icon = '' },
                Interface = { icon = '' },
                Function = { icon = '' },
                Variable = { icon = '󰫧' },
                String = { icon = '󰅳' },
                Boolean = { icon = '' },
                Key = { icon = '' },
                Null = { icon = '󰟢' },
                Event = { icon = '' },
            },
        },
    },
    config = true,
}
