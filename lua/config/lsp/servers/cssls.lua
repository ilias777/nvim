vim.lsp.config('cssls', {
    settings = {
        css = {
            validate = true,
            lint = { unknownAtRules = 'ignore' },
        },
        scss = {
            validate = true,
            lint = { unknownAtRules = 'ignore' },
        },
        less = {
            validate = true,
            lint = { unknownAtRules = 'ignore' },
        },
    },
})

vim.lsp.enable('cssls')
