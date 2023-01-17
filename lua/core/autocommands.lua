vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})
--
-- vim.api.nvim_create_autocmd('BufWritePost', {
--     pattern = 'packer_init.lua',
--     callback = function ()
--         vim.cmd('luafile %')
--         vim.cmd('lua vim.notify("Packer Source", "info")')
--     end,
-- })
