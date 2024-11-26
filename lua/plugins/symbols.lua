return {
    'oskarrrrrrr/symbols.nvim',
    enabled = true,
    cmd = 'Symbols',
    config = function()
        local r = require('symbols.recipes')
        require('symbols').setup(r.DefaultFilters, r.AsciiSymbols, {
            sidebar = {
                hide_cursor = false,
                open_direction = 'right',
                auto_resize = {
                    enabled = true,
                    min_width = 40,
                    max_width = 60,
                },
            },
        })
    end,
}
