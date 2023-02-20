return {
    'L3MON4D3/LuaSnip',
    version = '1.2.1',
    event = 'VeryLazy',
    dependencies = {
        'rafamadriz/friendly-snippets',
    },
    build = 'make install_jsregexp',
    config = function()
        local ls = require('luasnip')
        local types = require('luasnip.util.types')
        ls.config.set_config({
            history = true, --keep around last snippet local to jump back
            updateevents = 'TextChanged,TextChangedI', --update changes as you type
            enable_autosnippets = true,
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { '●', 'DiagnosticHint' } },
                    },
                },
            },
        })

        -- Luasnip keys
        vim.keymap.set({ 'i', 's' }, '<C-i>', function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump(-1)
            end
        end)

        vim.keymap.set({ 'i', 's' }, '<C-n>', function()
            if ls.jumpable(1) then
                ls.jump(1)
            end
        end)

        vim.keymap.set({ 'i', 's' }, '<C-p>', function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end)

        -- Luasnip Choice Nodes
        vim.keymap.set('i', '<C-ö>', function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end)

        vim.keymap.set('i', '<C-ä>', function()
            if ls.choice_active() then
                ls.change_choice(-1)
            end
        end)
    end,
}
