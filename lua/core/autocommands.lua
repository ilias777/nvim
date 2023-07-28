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
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'zsh', 'conf' },
    callback = function()
        vim.bo.filetype = 'sh'
    end,
})

-- Quit help with q
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'help',
    callback = function()
        vim.keymap.set('n', 'q', ':q<cr>', { silent = true })
    end,
})
