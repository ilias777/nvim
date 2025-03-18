return {
    'saghen/blink.cmp',
    enabled = true,
    lazy = true,
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
                draw = {
                    components = {
                        -- customize the drawing of kind icons
                        kind_icon = {
                            text = function(ctx)
                                -- default kind icon
                                local icon = ctx.kind_icon
                                -- if LSP source, check for color derived from documentation
                                if ctx.item.source_name == 'LSP' then
                                    local color_item = require('nvim-highlight-colors').format(
                                        ctx.item.documentation,
                                        { kind = ctx.kind }
                                    )
                                    if color_item and color_item.abbr then
                                        icon = color_item.abbr
                                    end
                                end
                                return icon .. ctx.icon_gap
                            end,
                            highlight = function(ctx)
                                -- default highlight group
                                local highlight = 'BlinkCmpKind' .. ctx.kind
                                -- if LSP source, check for color derived from documentation
                                if ctx.item.source_name == 'LSP' then
                                    local color_item = require('nvim-highlight-colors').format(
                                        ctx.item.documentation,
                                        { kind = ctx.kind }
                                    )
                                    if color_item and color_item.abbr_hl_group then
                                        highlight = color_item.abbr_hl_group
                                    end
                                end
                                return highlight
                            end,
                        },
                    },
                },
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
            ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },
        sources = {
            default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
            per_filetype = {
                markdown = { 'markview' },
            },
            providers = {
                lsp = {
                    min_keyword_length = 0,
                    score_offset = 0,
                },
                path = {
                    min_keyword_length = 0,
                },
                snippets = {
                    min_keyword_length = 2,
                },
                buffer = {
                    min_keyword_length = 2,
                    max_items = 5,
                },
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    score_offset = 100,
                },
            },
        },
        cmdline = {
            keymap = {
                ['<C-n>'] = {
                    function(cmp)
                        if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
                            return cmp.accept()
                        end
                    end,
                    'show_and_insert',
                    'select_next',
                },
                ['<C-p>'] = { 'show_and_insert', 'select_prev' },
                ['<CR>'] = { 'accept_and_enter', 'fallback' },
            },
            completion = {
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = true,
                    },
                },
                menu = {
                    auto_show = true,
                },
                ghost_text = { enabled = true },
            },
        },
    },
    opts_extend = { 'sources.default' },
}
