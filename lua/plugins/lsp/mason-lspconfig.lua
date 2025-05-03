return {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
    opts = {
        ensure_installed = {
            'cssls',
            'emmet_ls',
            'html',
            'intelephense',
            'jdtls',
            'jsonls',
            -- 'ltex',
            'lua_ls',
            'ruff',
            'rust_analyzer',
            'texlab',
            'ts_ls',
            'volar',
            'yamlls',
        },
    },
}
