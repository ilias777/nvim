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

-- zsh to sh filetype
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'zsh', 'conf' },
    callback = function()
        vim.lsp.inlay_hint(0, false)
    end,
})
