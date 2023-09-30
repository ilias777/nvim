local M = {}

-- Toggle split window from equalize to maximize
M.max_or_equal = function()
    local winwidth = vim.fn.winwidth(vim.api.nvim_get_current_win())
    if winwidth <= vim.o.columns / 2 then
        vim.cmd('wincmd|')
    else
        vim.cmd('wincmd=')
    end
end

-- Change language on ltex
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
