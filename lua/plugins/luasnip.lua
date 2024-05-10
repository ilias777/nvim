return {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    event = 'InsertEnter',
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
                ls.expand_or_jump()
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

        -- Disable diagnostics while expandingon select mode
        local augroup = vim.api.nvim_create_augroup('luasnip-expand', { clear = true })

        vim.api.nvim_create_autocmd('ModeChanged', {
            group = augroup,
            pattern = '*:s',
            callback = function()
                if ls.in_snippet() then
                    return vim.diagnostic.enable(false)
                end
            end,
        })

        vim.api.nvim_create_autocmd('ModeChanged', {
            group = augroup,
            -- pattern = '[is]:n',
            -- pattern = '*:n',
            pattern = 'n',
            callback = function()
                if ls.in_snippet() then
                    return vim.diagnostic.enable(true)
                end
            end,
        })
    end,
}
