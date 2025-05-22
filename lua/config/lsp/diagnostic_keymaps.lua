local keymap = require('utils.set_keymap')

local M = {}

function M.set()
    keymap.set({
        key = '<Space>d',
        cmd = vim.diagnostic.open_float,
        desc = 'Open Diagnostic Window',
    })
    keymap.set({
        key = '<space><left>',
        cmd = function()
            vim.diagnostic.jump({ count = -vim.v.count1 })
        end,
        desc = 'Previous Diagnostic',
    })
    keymap.set({
        key = '<space><right>',
        cmd = function()
            vim.diagnostic.jump({ count = vim.v.count1 })
        end,
        desc = 'Next Diagnostic',
    })
    keymap.set({
        key = '<space>q',
        cmd = vim.diagnostic.setloclist,
        desc = 'Send Diagnostic to Locallist',
    })
    keymap.set({
        key = 'gK',
        cmd = function()
            local new_config = not vim.diagnostic.config().virtual_lines
            vim.diagnostic.config({ virtual_lines = new_config })
        end,
        desc = 'Toggle diagnostic virtual_lines',
    })
end

return M
