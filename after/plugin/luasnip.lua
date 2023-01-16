local ls = require('luasnip')
local types = require('luasnip.util.types')
ls.config.set_config({
    history = true, --keep around last snippet local to jump back
    updateevents = 'TextChanged,TextChangedI', --update changes as you type
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { '●', 'DiagnosticSign' } },
            },
        },
    },
})

-- Luasnip Choice Node
vim.keymap.set('i', '<C-ö>', function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)
