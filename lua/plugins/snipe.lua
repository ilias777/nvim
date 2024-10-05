return {
    'leath-dub/snipe.nvim',
    keys = {
        {
            '<leader>b',
            function()
                require('snipe').open_buffer_menu()
            end,
            desc = 'Open Snipe buffer menu',
        },
    },
    opts = {
        ui = {
            --- @type "topleft" | "bottomleft" | "topright" | "bottomright" | "center" | "cursor"
            position = 'bottomright',
        },
    },
}
