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

vim.lsp.config.ts_ls = {
    init_options = {
        plugins = {
            {
                name = '@/vue/typescript-plugin',
                location = '/Users/ilias/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server',
                languages = { 'javascript', 'typescript', 'vue' },
            },
        },
    },
    filetypes = {
        'javascript',
        'typescript',
        'vue',
    },
    settings = {
        typescript = {
            inlayHints = inlayHints,
        },
        javascript = {
            inlayHints = inlayHints,
        },
    },
}

vim.lsp.enable('ts_ls')
