local keymap = require('utils.set_keymap')

local function set_typescript_keymaps(client, bufnr)
    -- Organize Imports
    keymap.set({
        key = '<leader>io',
        cmd = function()
            client:exec_cmd({
                command = '_typescript.organizeImports',
                arguments = { vim.api.nvim_buf_get_name(bufnr) },
            })
        end,
        desc = 'Organize Imports',
        bufnr = bufnr,
    })

    -- Remove Unused Imports
    keymap.set({
        key = '<leader>ir',
        cmd = function()
            vim.lsp.buf.code_action({
                apply = true,
                context = {
                    diagnostics = {},
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    only = { 'source.removeUnusedImports.ts' },
                },
            })
        end,
        desc = 'Remove Unused Imports',
        bufnr = bufnr,
    })

    -- Add Missing Imports
    keymap.set({
        key = '<leader>ai',
        cmd = function()
            vim.lsp.buf.code_action({
                apply = true,
                context = {
                    diagnostics = {},
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    only = { 'source.addMissingImports.ts' },
                },
            })
        end,
        desc = 'Add Missing Imports',
        bufnr = bufnr,
    })
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('ts_ls.lsp', { clear = true }),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local bufnr = args.buf

        if client.name == 'ts_ls' then
            set_typescript_keymaps(client, bufnr)
        end
    end,
})

local inlayHints = {
    includeInlayParameterNameHints = 'all',
    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
    includeInlayFunctionParameterTypeHints = true,
    includeInlayVariableTypeHints = true,
    includeInlayPropertyDeclarationTypeHints = true,
    includeInlayFunctionLikeReturnTypeHints = true,
    includeInlayEnumMemberValueHints = true,
    importModuleSpecifierPreference = 'non-relative',
}

local vue_language_server_path = vim.fn.expand('$MASON/packages')
    .. '/vue-language-server'
    .. '/node_modules/@vue/language-server'

local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }

local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vue_language_server_path,
    languages = { 'vue' },
    configNamespace = 'typescript',
}

local vue_ls_config = {}

local vtsls_config = {
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                },
            },
        },
    },
    filetypes = tsserver_filetypes,
}

local ts_ls_config = {
    init_options = {
        plugins = {
            vue_plugin,
        },
    },
    filetypes = tsserver_filetypes,
    settings = {
        typescript = {
            inlayHints = inlayHints,
        },
        javascript = {
            inlayHints = inlayHints,
        },
    },
}

vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.config('ts_ls', ts_ls_config)

vim.lsp.enable({ 'ts_ls', 'vue_ls' })
