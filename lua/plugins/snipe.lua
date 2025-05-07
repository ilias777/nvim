return {
    'leath-dub/snipe.nvim',
    keys = {
        {
            '-',
            function()
                require('snipe').open_buffer_menu()
            end,
            desc = 'Open Snipe buffer menu',
        },
    },
    opts = {
        ui = {
            --- @type "topleft" | "bottomleft" | "topright" | "bottomright" | "center" | "cursor"
            position = 'center',
            preselect_current = true,
            text_align = 'file-first',
        },
        hints = {
            ---@type string
            dictionary = 'sadfwecmpghio',
        },
        navigate = {
            under_cursor = 'l',
            cancel_snipe = { '<esc>', 'q' },
            open_split = 'S',
        },
        sort = 'first',
    },
}
