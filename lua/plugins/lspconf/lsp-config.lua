--  ╭──────────────────────────────────────────────────────────╮
--  │                    LSP Configuration                     │
--  ╰──────────────────────────────────────────────────────────╯

-- NEODEV
require('neodev').setup()

-- MASON
require('mason').setup({
    ui = {
        icons = {
            package_installed = ' ',
            package_pending = ' ',
            package_uninstalled = ' ',
        },
        border = 'rounded',
    },
})

-- MASON LSPCONFIG
require('mason-lspconfig').setup({
    ensure_installed = {
        'cssls',
        'emmet_ls',
        'html',
        'intelephense',
        'jdtls',
        'jsonls',
        'ltex',
        'lua_ls',
        'pyright',
        'rust_analyzer',
        'texlab',
        'tsserver',
        'volar',
        'yamlls',
    },
})

-- LSPCONFIG
local lspconfig = require('lspconfig')

-- CMP LSP CAPABILITIES
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities =
    vim.tbl_deep_extend('force', lsp_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

require('lspconfig.ui.windows').default_options.border = 'rounded'

-- WINBAR WITH NAVIC
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- local navic = require('nvim-navic')

-- KEYMAPS
local opts = function(desc)
    return { noremap = true, silent = true, desc = desc }
end

-- local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts('Open Diagnostic Window'))
vim.keymap.set('n', '<space><left>', vim.diagnostic.goto_prev, opts('Previous Diagnostic'))
vim.keymap.set('n', '<space><right>', vim.diagnostic.goto_next, opts('Next Diagnostic'))
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts('Send Diagnostic to Locallist'))

-- LSPATTACH AUTOCOMMAND
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = function(desc)
            return { buffer = ev.buf, desc = desc }
        end
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts('Go to Declaration'))
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts('Go to Definition'))
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts('Hover'))
        vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, bufopts('Go to Implementation'))
        vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts('Singature Help'))
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts('Add Workspace Folder'))
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts('Remove Workspace Folder'))
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts('List Workspace Folder'))
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts('Type Definition'))
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts('Rename with LSP'))
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, bufopts('Code Action'))
        vim.keymap.set('n', 'gR', vim.lsp.buf.references, bufopts('Go to Reference'))
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format({ async = true })
        end, bufopts('Formatting with LSP'))

        -- Inlay Hints
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(ev.buf, true)
        else
            vim.lsp.inlay_hint.enable(ev.buf, false)
        end
    end,
})

-- TOGGLE INLAY HINTS
if vim.lsp.inlay_hint then
    vim.keymap.set('n', '<Space>ih', function()
        vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
    end, { desc = 'Toggle Inlay Hints' })
end

-- BORDERS FOR DIAGNOSTICS
-- vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#181926]])
-- vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#181926]])

local border = {
    { '┌', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '┐', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '┘', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '└', 'FloatBorder' },
    { '│', 'FloatBorder' },
}

-- LSP SETTINGS (FOR OVERRIDING PER CLIENT)
local handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- DISABLE LSP (NOT CMP) INLINE DIAGNOSTICS ERROR MESSAGES
-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     virtual_text = false,
-- })

-- DIAGNOSTICS SIGNS
local signs = { Error = ' ', Warn = ' ', Hint = '󰌶 ', Info = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '', -- Could be '●', '▎', │, 'x', '■', , 
    },
    float = { border = border },
    -- virtual_text = false,
    -- signs = true,
    -- underline = true,
})

--  ╭──────────────────────────────────────────────────────────╮
--  │                         SERVERS                          │
--  ╰──────────────────────────────────────────────────────────╯
-- LUA SERVER
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
lspconfig.lua_ls.setup({
    -- For nvim-navic
    -- on_attach = function(client, bufnr)
    --     navic.attach(client, bufnr)
    -- end,
    handlers = handlers,
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            -- "${3rd}/luv/library"
                            -- "${3rd}/busted/library",
                        },
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                        -- library = vim.api.nvim_get_runtime_file("", true)
                    },
                    telemetry = {
                        enable = false,
                    },
                    hint = {
                        enable = true,
                    },
                },
            })

            client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
        end
        return true
    end,
    -- OLD CONFIGURATION FOR ON_ATTACH FUNCTION
    -- settings = {
    --     Lua = {
    --         runtime = {
    --             version = 'LuaJIT',
    --             path = runtime_path,
    --         },
    --         diagnostics = {
    --             -- enable = true,
    --             globals = { 'vim', 'use', 'winid' },
    --             disable = { 'undefined-field', 'undefined-doc-name' },
    --         },
    --         workspace = {
    --             library = {
    --                 vim.env.VIMRUNTIME,
    --                 -- [vim.fn.expand('$VIMRUNTIME/lua')] = true,
    --                 -- [vim.fn.stdpath('config') .. '/lua'] = true,
    --                 -- [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
    --                 '${3rd}/luv/library',
    --                 -- [vim.fn.stdpath('data') .. '/mason/packages/lua-language-server/libexec/meta/3rd/luv/library'] = true,
    --                 [vim.fn.expand('%:p:h')] = true,
    --             },
    --             -- library = vim.api.nvim_get_runtime_file('', true),
    --             -- library = ${workspace}/**/init.lua,
    --         },
    --         completion = {
    --             enable = true,
    --             callSnippet = 'Both',
    --         },
    --         format = {
    --             enable = true,
    --             defaultConfig = {
    --                 indent_style = 'space',
    --                 indent_size = '4',
    --                 quote_style = 'single',
    --             },
    --         },
    --         hint = {
    --             enable = true,
    --             arrayIndex = 'Disable',
    --         },
    --         telemetry = {
    --             enable = false,
    --         },
    --     },
    -- },
})

-- JAVASCRIPT SERVER
lspconfig.tsserver.setup({
    handlers = handlers,
    init_options = {
        preferences = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
            importModuleSpecifierPreference = 'non-relative',
        },
    },
    -- on_attach = function(client, bufnr)
    --     client.server_capabilities.document_formatting = false
    --     client.server_capabilities.document_range_formatting = false
    --     on_attach(client, bufnr)
    -- end,
})

-- PYTHON SERVER
lspconfig.pyright.setup({
    handlers = handlers,
})

-- EMMET SERVER
lspconfig.emmet_ls.setup({
    handlers = handlers,
})

-- CSS SERVER
lspconfig.cssls.setup({
    handlers = handlers,
    settings = {
        css = {
            lint = {
                unknownAtRules = 'ignore',
            },
        },
    },
})

-- TAILWIND SERVER
-- lspconfig.tailwindcss.setup({
--     handlers = handlers,
-- })

-- VOLAR VUE SERVER
lspconfig.volar.setup({
    handlers = handlers,
    filetypes = {
        'vue', --[[ 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'json' ]]
    },
    init_options = {
        typescript = {
            tsdk = '/Users/ilias/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib',
        },
        preferences = {
            disableSuggestions = true,
        },
        languageFeatures = {
            implementation = true,
            references = true,
            definition = true,
            typeDefinition = true,
            callHierarchy = true,
            hover = true,
            rename = true,
            renameFileRefactoring = true,
            signatureHelp = true,
            codeAction = true,
            workspaceSymbol = true,
            diagnostics = true,
            semanticTokens = true,
            completion = {
                defaultTagNameCase = 'both',
                defaultAttrNameCase = 'kebabCase',
                getDocumentNameCasesRequest = false,
                getDocumentSelectionRequest = false,
            },
        },
    },
})

-- JSON SERVER
lspconfig.jsonls.setup({
    handlers = handlers,
    filetypes = { 'json', 'jsonc' },
    init_options = {
        provideFormatter = true,
    },
})

-- HTML SERVER
lspconfig.html.setup({
    handlers = handlers,
    settigns = {
        css = {
            lint = {
                validProperties = {},
            },
        },
    },
})

-- LTEX SERVER
lspconfig.ltex.setup({
    handlers = handlers,
    settings = {
        ltex = {
            language = 'de-DE',
            enabled = { 'bibtex', 'markdown', 'latex', 'tex' },
        },
    },
})

-- TEXLAB SERVER
lspconfig.texlab.setup({
    handlers = handlers,
    settings = {
        texlab = {
            auxDirectory = '.',
            bibtexFormatter = 'texlab',
            build = {
                args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
                executable = 'latexmk',
                forwardSearchAfter = false,
                onSave = false,
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = false,
            },
            diagnosticsDelay = 300,
            formatterLineLength = 100,
            forwardSearch = {
                args = {},
            },
            latexFormatter = 'latexindent',
            latexindent = {
                modifyLineBreaks = false,
            },
        },
    },
})

-- PHP SERVER
lspconfig.intelephense.setup({
    handlers = handlers,
})

-- JAVA SERVER
-- lspconfig.jdtls.setup({
--     handlers = handlers,
-- })

-- YAML SERVER
lspconfig.yamlls.setup({
    handlers = handlers,
    settings = {
        yaml = {
            validate = true,
            hover = true,
            completion = true,
            format = {
                enable = true,
                singleQuote = true,
                bracketSpacing = true,
            },
            editor = {
                tabSize = 2,
            },
            schemaStore = {
                enable = true,
            },
        },
        editor = {
            tabSize = 2,
        },
    },
})

-- RUST
lspconfig.rust_analyzer.setup({
    handlers = handlers,
})
