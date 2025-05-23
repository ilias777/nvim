vim.lsp.config('vue_ls', {
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    init_options = {
        vue = {
            hybridMode = false,
        },
    },
})

vim.lsp.enable('vue_ls')
