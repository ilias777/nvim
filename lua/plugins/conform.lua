return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        formatters_by_ft = {
            css = { 'css_beautify' },
            html = { 'html_beautify' },
            javascript = { 'js_beautify' },
            json = { 'prettier' },
            tex = { 'latexindent' },
            lua = { 'stylua' },
            markdown = { 'prettier' },
            php = { 'prettier' },
            python = { 'black' },
            rust = { 'rustfmt' },
            scss = { 'prettier' },
            vue = { 'prettier' },
            yaml = { 'yamlfmt' },
        },
        format_on_save = {
            lsp_format = 'fallback',
            async = false,
            timeout_ms = 500,
        },
        -- formatters = {
        --     latexindent = {
        --         prepend_args = { '-l', '/Users/ilias/.indentconfig.yaml' },
        --     },
        -- },
    },
}
