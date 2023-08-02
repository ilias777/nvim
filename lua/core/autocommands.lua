-- Highlight selectes text
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})

-- Cursorline on normal mode and no cursorline on insert mode
-- vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
--     callback = function()
--         vim.opt.cursorline = true
--     end,
-- })
--
-- vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
--     callback = function()
--         vim.opt.cursorline = false
--     end,
-- })

-- Disable inlay hints for specific filetypes
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'zsh', 'conf' },
    callback = function()
        vim.lsp.inlay_hint(0, false)
    end,
})

-- Force treesitter to work with specific filestypes
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = { 'zsh', 'conf' },
--     callback = function()
--         vim.bo.filetype = 'sh'
--     end,
-- })

-- Force treesitter to work with specific filestypes
vim.filetype.add({
    extension = {
        sh = 'sh',
        zsh = 'sh',
        conf = 'sh',
    },
    filename = {
        ['.zshrc'] = 'sh',
        ['.zshenv'] = 'sh',
        ['.conf'] = 'sh',
    },
})

-- Quit some windows with q
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'help', 'qf', 'checkhealth', 'man' },
    callback = function()
        vim.keymap.set('n', 'q', '<cmd>bd<cr>', { silent = true, buffer = true })
    end,
})

-- Check if code actions are availeble on lsp
-- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--     callback = function()
--         require('code_action_utils').code_action_listener()
--     end,
-- })
