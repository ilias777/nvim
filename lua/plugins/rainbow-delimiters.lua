return {
    'HiPhish/rainbow-delimiters.nvim',
    enabled = true,
    event = 'BufReadPre',
    config = function()
        local rainbow_delimiters = require('rainbow-delimiters')
        local christmas = require('rainbow-delimiters.strategy.christmas')
        local christmas_lights = christmas.lights(rainbow_delimiters.strategy['global'])

        vim.g.rainbow_delimiters = {
            strategy = {
                -- [''] = christmas_lights,
                [''] = rainbow_delimiters.strategy['global'],
                vim = rainbow_delimiters.strategy['local'],
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
            },
            highlight = {
                'RainbowDelimiterRed',
                'RainbowDelimiterYellow',
                'RainbowDelimiterBlue',
                'RainbowDelimiterOrange',
                'RainbowDelimiterGreen',
                'RainbowDelimiterViolet',
                'RainbowDelimiterCyan',
            },
        }
    end,
}
