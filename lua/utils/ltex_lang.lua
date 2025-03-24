local M = {}

function M.set_ltex_lang(lang)
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
        if client.name == 'ltex_plus' then
            vim.notify('LTeX-Language: ' .. lang, vim.log.levels.INFO, {
                title = 'LTeX Language',
                timeout = 2000,
            })
            client.config.settings.ltex.language = lang
            vim.lsp.buf_notify(0, 'workspace/didChangeConfiguration', {
                settings = client.config.settings,
            })
            return
        end
    end
    vim.notify('No LTeX-Client active.', vim.log.levels.ERROR, {
        title = 'LTeX Language',
        timeout = 2000,
    })
end

function M.select_lang_menu()
    local languages = {
        ['German'] = 'de',
        ['English'] = 'en',
        ['Greek'] = 'el',
    }

    vim.ui.select(vim.tbl_keys(languages), {
        prompt = 'Choose a LTeX language:',
    }, function(choice)
        if choice then
            M.set_ltex_lang(languages[choice])
        end
    end)
end

vim.api.nvim_create_user_command('LtexLangMenu', function()
    M.select_lang_menu()
end, {
    desc = 'Language for LTeX (de/en/el)',
})

return M
