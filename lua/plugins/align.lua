return {
    'Vonr/align.nvim',
    enabled = false,
    branch = 'v2',
    lazy = true,
    -- keys = {
    --     { 'aa', mode = { 'v' } },
    -- },
    init = function()
        local NS = { noremap = true, silent = true }

        -- Aligns to 1 character
        vim.keymap.set('x', 'aa', function()
            require('align').align_to_char({
                length = 1,
            })
        end, NS)

        -- Aligns to a Vim regex with previews
        vim.keymap.set('x', 'aR', function()
            require('align').align_to_string({
                preview = true,
                regex = true,
            })
        end, NS)

        -- Example gawip to align a paragraph to a string with previews
        vim.keymap.set('n', 'gaw', function()
            local a = require('align')
            a.operator(a.align_to_string, {
                regex = false,
                preview = true,
            })
        end, NS)
    end,
}
