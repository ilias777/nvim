local M = {}

M.show_user_words = function()
    local lang = vim.opt.spelllang:get()[1] or 'de'
    local path = vim.fn.stdpath('config') .. '/spell/' .. lang .. '.utf-8.add'
    local f = io.open(path, 'r')

    if not f then
        vim.notify('Keine Benutzerwörter gefunden für: ' .. lang, vim.log.levels.INFO)
        return
    end

    local words = {}
    for line in f:lines() do
        table.insert(words, line)
    end
    f:close()

    vim.ui.select(words, { prompt = 'Benutzerwörter (' .. lang .. '):' }, function(choice)
        if choice then
            vim.fn.setreg('+', choice)
            vim.notify('Wort in Zwischenablage: ' .. choice, vim.log.levels.WARN)
        end
    end)
end

vim.api.nvim_create_user_command('SpellUserWords', M.show_user_words, {})

return M
