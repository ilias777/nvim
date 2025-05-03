return {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    lazy = true,
    opts = {
        registries = {
            'github:mason-org/mason-registry',
            'github:visimp/mason-registry',
        },
        ui = {
            icons = {
                package_installed = ' ',
                package_pending = ' ',
                package_uninstalled = ' ',
            },
            border = 'single',
            -- height = 0.8,
        },
    },
}
