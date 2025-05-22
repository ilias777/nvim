vim.lsp.config.ltex_plus = {
    on_attach = function(client, bufnr)
        require('ltex_extra').setup()
    end,
}

vim.lsp.enable('ltex_plus')
