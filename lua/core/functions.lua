M = {}

M.set_ltex_lang = function(lang)
    local clients = vim.lsp.get_clients({ bufnr = 0 })

    for _, client in ipairs(clients) do
        if client.name == 'ltex' then
            vim.api.nvim_notify('Set ltex-ls lang to ' .. lang, vim.log.levels.INFO, {
                title = 'Language',
                timeout = 2000,
            })
            client.config.settings.ltex.language = lang
            vim.lsp.buf_notify(0, 'workspace/didChangeConfiguration', { settings = client.config.settings })
            return
        end
    end
end

return M
