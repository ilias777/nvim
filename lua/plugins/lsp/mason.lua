return {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    cmd = 'Mason',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
}
