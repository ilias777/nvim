return {
    'saghen/blink.cmp',
    enabled = true,
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    opts = {
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'mono',
            kind_icons = require('lib.icons').kind,
        },
        completion = {
            menu = {
                border = 'single',
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 250,
                window = { border = 'single' },
            },
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            ghost_text = {
                enabled = true,
            },
            list = {
                selection = {
                    preselect = function(ctx)
                        return ctx.mode ~= 'cmdline' and not require('blink.cmp').snippet_active({ direction = 1 })
                    end,
                    auto_insert = function(ctx)
                        return ctx.mode ~= 'cmdline'
                    end,
                },
            },
        },
        signature = {
            enabled = true,
            window = {
                border = 'single',
            },
        },
        keymap = {
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<Tab>'] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.accept()
                    else
                        return cmp.select_and_accept()
                    end
                end,
                'snippet_forward',
                'fallback',
            },
            ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
            ['<C-l>'] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.accept()
                    else
                        return cmp.select_and_accept()
                    end
                end,
                'snippet_forward',
                'fallback',
            },
            ['<C-h>'] = { 'snippet_backward', 'fallback' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            cmdline = function()
                local type = vim.fn.getcmdtype()
                -- Search forward and backward
                if type == '/' or type == '?' then
                    return { 'buffer' }
                end
                -- Commands
                if type == ':' then
                    return { 'cmdline' }
                end
                return {}
            end,
            providers = {
                lsp = {
                    min_keyword_length = 2, -- Number of characters to trigger porvider
                    score_offset = 0, -- Boost/penalize the score of the items
                },
                path = {
                    min_keyword_length = 0,
                },
                snippets = {
                    min_keyword_length = 2,
                },
                buffer = {
                    min_keyword_length = 5,
                    max_items = 5,
                },
            },
        },
    },
    opts_extend = { 'sources.default' },
}
