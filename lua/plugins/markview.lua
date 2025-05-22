return {
    'OXY2DEV/markview.nvim',
    enabled = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local presets = require('markview.presets').headings
        require('markview').setup({
            markdown = {
                headings = presets.glow,
            },
            typst = {
                enable = false,
            },
            preview = {
                icon_provider = 'devicons', -- "mini" or "devicons" or "internal"
            },
        })
    end,
}
