local diagnostic_config = require('config.lsp.diagnostic_config')
local lsp_keymaps = require('config.lsp.lsp_keymaps')
local diagnostic_keymaps = require('config.lsp.diagnostic_keymaps')

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('global.lsp', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Get client
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        -- Diagnostic Keymaps
        diagnostic_keymaps.set()

        -- LSP Keymaps
        lsp_keymaps.set()

        -- Diagnostic Config
        diagnostic_config.set()

        -- ── INLAY HINTS ───────────────────────────────────────────
        if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
        else
            vim.lsp.inlay_hint.enable(false)
        end

        -- ── TOGGLE INLAY HINTS ────────────────────────────────────
        if vim.lsp.inlay_hint then
            vim.keymap.set('n', '<Space>ih', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, { desc = 'Toggle Inlay Hints' })
        end

        -- ── NVIM-NAVIC ────────────────────────────────────────────
        local navic = require('nvim-navic')
        if client and client.server_capabilities.documentSymbolProvider then
            vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
            navic.attach(client, ev.buf)
        end
    end,
})

vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
})
