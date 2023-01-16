-- Basic setup
-- require("null-ls").setup({
--     sources = {
--         require("null-ls").builtins.formatting.stylua,
--         require("null-ls").builtins.formatting.prettier,
--         require("null-ls").builtins.formatting.black,
--         require("null-ls").builtins.diagnostics.eslint,
--     },
-- })

-- For formatting on save
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == 'null-ls'
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- Configuration
require('null-ls').setup({
    debug = false,
    sources = {
        -- FORMATTING
        require('null-ls').builtins.formatting.prettier,
        -- require('null-ls').builtins.formatting.prettier.with({
        --     -- disabled_filetypes = { 'yaml' },
        --     extra_args = {
        --         '--single-quote',
        --         '--tab-width',
        --         4,
        --         '--bracket-same-line',
        --         '--print-width',
        --         100,
        --     },
        -- }),
        -- require('null-ls').builtins.formatting.stylua,
        require('null-ls').builtins.formatting.stylua.with({
            extra_args = {
                '--indent-type',
                'Spaces',
                '--quote-style',
                'AutoPreferSingle',
                '--column-width',
                500,
            },
        }),
        require('null-ls').builtins.formatting.black,
        -- require('null-ls').builtins.formatting.latexindent,
        require('null-ls').builtins.formatting.latexindent.with({
            extra_args = {
                '-l',
                '/Users/ilias/.indentconfig.yaml',
            },
        }),

        -- DIAGNOSTICS
        -- JavaScript
        require('null-ls').builtins.diagnostics.eslint,
        -- require('null-ls').builtins.diagnostics.standard.with({
        --     -- filetypes = { 'javascript' },
        --     extra_args = {
        --         '--fix',
        --     },
        -- }),

        --Python
        -- require('null-ls').builtins.diagnostics.flake8,
        require('null-ls').builtins.diagnostics.ruff,

        -- JSON
        require('null-ls').builtins.diagnostics.jsonlint,

        -- Editorconfig
        -- require('null-ls').builtins.diagnostics.editorconfig_checker,

        -- Lua
        require('null-ls').builtins.diagnostics.luacheck.with({
            extra_args = {
                '--globals',
                'vim',
                'use',
                'winid',
                'pairs',
                '--no-max-line-length',
            },
        }),

        -- CODE ACTIONS
        require('null-ls').builtins.code_actions.eslint,
        require('null-ls').builtins.code_actions.gitsigns,

        -- COMPLETION
        -- require('null-ls').builtins.completion.spell,

        -- HOVER
        -- require('null-ls').builtins.hover.dictionary,
    },

    -- Format on save
    on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    lsp_formatting(bufnr)
                end,
            })
        end
    end,
})
