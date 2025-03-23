local M = {}

local spell_options = {
    { label = '🇩🇪 German', langs = { 'de' } },
    { label = '🇬🇧 English', langs = { 'en_us' } },
    { label = '🇩🇪 + 🇬🇧 German + English', langs = { 'de', 'en_us' } },
    { label = '🇬🇷 Greek', langs = { 'el' } },
}

M.choose_spelllang = function()
    local labels = vim.tbl_map(function(opt)
        return opt.label
    end, spell_options)

    vim.ui.select(labels, { prompt = '󰓆 Choose spelling' }, function(choice)
        for _, opt in ipairs(spell_options) do
            if opt.label == choice then
                vim.opt.spell = true
                vim.opt.spelllang = opt.langs
                vim.notify('󰓆 Active spelling: ' .. table.concat(opt.langs, ', '), vim.log.levels.WARN)
                return
            end
        end
    end)
end

vim.api.nvim_create_user_command('SpelllangSelect', M.choose_spelllang, {})

return M
