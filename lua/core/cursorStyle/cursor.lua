local bg = vim.o.background
local palette_dark = require('catppuccin.palettes').get_palette('mocha')
local palette_light = require('catppuccin.palettes').get_palette('latte')
local color = bg == 'dark' and palette_dark or palette_light
local U = require('catppuccin.utils.colors')

vim.api.nvim_create_autocmd('ModeChanged', {
    pattern = { '*:v', '*:V', '*:', 'v:*', 'V:*', ':*', '*:R', 'R:*' },
    callback = function()
        local mode = vim.fn.mode()

        if mode == 'v' or mode == 'V' or mode == '\22' then
            vim.cmd('highlight Cursor guibg=' .. color.mauve)
        elseif mode == 'R' or mode == 'r' then
            vim.cmd('highlight CursorLine guibg=' .. U.darken(color.pink, 0.15, color.base))
        else
            vim.cmd('highlight Cursor guibg=' .. color.text)
            vim.cmd('highlight CursorLine guibg=' .. color.mantle)
        end
    end,
})

vim.on_key(function(key)
    if key == 'r' and vim.fn.mode() == 'n' then
        vim.cmd('highlight CursorLine guibg=' .. U.darken(color.pink, 0.15, color.base))
        vim.defer_fn(function()
            if vim.fn.mode() == 'n' then
                vim.cmd('highlight CursorLine guibg=' .. color.mantle)
            end
        end, 100)
    end
end, vim.api.nvim_create_namespace('cursor_replace_one'))

vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
    callback = function()
        vim.cmd('highlight CursorLine guibg=' .. U.darken(color.green, 0.15, color.base))
    end,
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
    callback = function()
        vim.cmd('highlight CursorLine guibg=' .. color.mantle)
    end,
})
