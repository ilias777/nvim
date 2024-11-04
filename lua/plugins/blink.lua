return {
    'saghen/blink.cmp',
    enabled = true,
    lazy = false,
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
        keymap = {
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<C-l>'] = { 'snippet_forward', 'fallback' },
            ['<C-h>'] = { 'snippet_backward', 'fallback' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        },
        accept = {
            auto_brackets = {
                enabled = true,
            },
        },
        trigger = {
            signature_help = {
                enabled = true,
            },
        },
        sources = {
            completion = {
                enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
            },
            providers = {
                -- dont show LuaLS require statements when lazydev has items
                lsp = { fallback_for = { 'lazydev' } },
                lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink' },
            },
        },
        windows = {
            autocomplete = {
                border = 'single',
            },
            documentation = {
                border = 'single',
                auto_show = true,
            },
            ghost_text = {
                enabled = true,
            },
        },
        nerd_font_variant = 'normal',
        kind_icons = {
            Class = '',
            Color = '󰏘',
            Constant = '',
            Constructor = '',
            Enum = '',
            EnumMember = '',
            Event = '',
            Field = '󰜢',
            File = '󰈔',
            Folder = '',
            Function = '󰊕',
            Interface = '',
            Keyword = '󰌆',
            Method = '',
            Module = '󰏗',
            Operator = '󰆕',
            Property = '󰖷',
            Reference = '',
            Snippet = '',
            Struct = '',
            Text = '',
            TypeParameter = '󰅲',
            Unit = '󰪚',
            Value = '󰎠',
            Variable = '󰆦',
        },
    },
}
