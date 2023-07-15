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
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
    callback = function()
        vim.opt.cursorline = true
    end,
})

vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
    callback = function()
        vim.opt.cursorline = false
    end,
})

-- Inlay hints
-- vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
--     callback = function()
--         vim.lsp.buf.inlay_hint(0, true)
--     end,
-- })
-- vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
--     callback = function()
--         vim.lsp.buf.inlay_hint(0, false)
--     end,
-- })
