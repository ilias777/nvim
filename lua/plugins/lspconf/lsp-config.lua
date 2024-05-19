--  ╭──────────────────────────────────────────────────────────╮
--  │                    LSP CONFIGURATION                     │
--  ╰──────────────────────────────────────────────────────────╯

-- ╭────────╮
-- │ NEODEV │
-- ╰────────╯
require('neodev').setup()

-- ╭───────╮
-- │ MASON │
-- ╰───────╯
require('mason').setup({
    ui = {
        icons = {
            package_installed = ' ',
            package_pending = ' ',
            package_uninstalled = ' ',
        },
        border = 'single',
    },
})

-- ╭─────────────────╮
-- │ MASON LSPCONFIG │
-- ╰─────────────────╯
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

-- ╭───────────╮
-- │ LSPCONFIG │
-- ╰───────────╯
local lspconfig = require('lspconfig')

-- ╭──────────────────────╮
-- │ CMP LSP CAPABILITIES │
-- ╰──────────────────────╯
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities =
    vim.tbl_deep_extend('force', lsp_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

-- ╭─────────────────────────────────╮
-- │ LSP BORDER FOR :LSPINFO COMMAND │
-- ╰─────────────────────────────────╯
require('lspconfig.ui.windows').default_options.border = 'single'

-- ╭───────────────────╮
-- │ WINBAR WITH NAVIC │
-- ╰───────────────────╯
local navic = require('nvim-navic')

-- ╭───────────────────────╮
-- │ LSPATTACH AUTOCOMMAND │
-- ╰───────────────────────╯
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- ╭─────────╮
        -- │ KEYMAPS │
        -- ╰─────────╯
        local bufopts = function(desc)
            return { noremap = true, silent = true, buffer = ev.buf, desc = desc }
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

        vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, bufopts('Open Diagnostic Window'))
        vim.keymap.set('n', '<space><left>', vim.diagnostic.goto_prev, bufopts('Previous Diagnostic'))
        vim.keymap.set('n', '<space><right>', vim.diagnostic.goto_next, bufopts('Next Diagnostic'))
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, bufopts('Send Diagnostic to Locallist'))

        -- Get client
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        -- ╭─────────────╮
        -- │ INLAY HINTS │
        -- ╰─────────────╯
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
        else
            vim.lsp.inlay_hint.enable(false)
        end

        -- ╭────────────╮
        -- │ NVIM-NAVIC │
        -- ╰────────────╯
        if client.server_capabilities.documentSymbolProvider then
            vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
            navic.attach(client, ev.buf)
        end
    end,
})

-- ╭────────────────────╮
-- │ TOGGLE INLAY HINTS │
-- ╰────────────────────╯
if vim.lsp.inlay_hint then
    vim.keymap.set('n', '<Space>ih', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = 'Toggle Inlay Hints' })
end

-- ╭─────────────╮
-- │ LSP BORDERS │
-- ╰─────────────╯
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

local handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- ╭─────────────────────────────────────────╮
-- │ DISABLE LSP INLINE DIAGNOSTICS MESSAGES │
-- ╰─────────────────────────────────────────╯
-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     virtual_text = false,
-- })

-- ╭───────────────────╮
-- │ DIAGNOSTICS SIGNS │
-- ╰───────────────────╯
local signs = { Error = ' ', Warn = ' ', Hint = '󰌶 ', Info = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- ╭───────────────────╮
-- │ DIAGNOSTIC CONFIG │
-- ╰───────────────────╯
vim.diagnostic.config({
    virtual_text = {
        prefix = '', -- Could be '●', '▎', │, 'x', '■', , 
    },
    float = { border = 'single' },
})

--  ╭──────────────────────────────────────────────────────────╮
--  │                         SERVERS                          │
--  ╰──────────────────────────────────────────────────────────╯

-- ╭────────────╮
-- │ LUA SERVER │
-- ╰────────────╯
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
lspconfig.lua_ls.setup({
    handlers = handlers,
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
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
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                },
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
            },
        })
        client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
    end,
    settings = {
        Lua = {},
    },

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

-- ╭───────────────────╮
-- │ JAVASCRIPT SERVER │
-- ╰───────────────────╯
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

-- ╭───────────────╮
-- │ PYTHON SERVER │
-- ╰───────────────╯
lspconfig.pyright.setup({
    handlers = handlers,
})

-- ╭──────────────╮
-- │ EMMET SERVER │
-- ╰──────────────╯
lspconfig.emmet_ls.setup({
    handlers = handlers,
})

-- ╭────────────╮
-- │ CSS SERVER │
-- ╰────────────╯
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

-- ╭─────────────────╮
-- │ TAILWIND SERVER │
-- ╰─────────────────╯
-- lspconfig.tailwindcss.setup({
--     handlers = handlers,
-- })

-- ╭──────────────────╮
-- │ VOLAR VUE SERVER │
-- ╰──────────────────╯
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

-- ╭─────────────╮
-- │ JSON SERVER │
-- ╰─────────────╯
lspconfig.jsonls.setup({
    handlers = handlers,
    filetypes = { 'json', 'jsonc' },
    init_options = {
        provideFormatter = true,
    },
})

-- ╭─────────────╮
-- │ HTML SERVER │
-- ╰─────────────╯
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

-- ╭─────────────╮
-- │ LTEX SERVER │
-- ╰─────────────╯
lspconfig.ltex.setup({
    handlers = handlers,
    filetypes = { 'bibtex', 'markdown', 'latex', 'tex' },
    settings = {
        ltex = {
            language = 'de-DE',
        },
    },
})

-- ╭───────────────╮
-- │ TEXLAB SERVER │
-- ╰───────────────╯
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

-- ╭────────────╮
-- │ PHP SERVER │
-- ╰────────────╯
lspconfig.intelephense.setup({
    handlers = handlers,
})

-- ╭─────────────╮
-- │ JAVA SERVER │
-- ╰─────────────╯
-- lspconfig.jdtls.setup({
--     handlers = handlers,
-- })

-- ╭─────────────╮
-- │ YAML SERVER │
-- ╰─────────────╯
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

-- ╭─────────────╮
-- │ RUST SERVER │
-- ╰─────────────╯
lspconfig.rust_analyzer.setup({
    handlers = handlers,
})

-- ╭──────────────╮
-- │ TYPST SERVER │
-- ╰──────────────╯
-- lspconfig.typst_lsp.setup({
--     handlers = handlers,
--     settings = {
--         exportPdf = 'onSave',
--     },
-- })

-- ╭─────────────────────────╮
-- │ TINYMIST (TYPST) SERVER │
-- ╰─────────────────────────╯
lspconfig.tinymist.setup({
    handlers = handlers,
    single_file_support = true,
    root_dir = function()
        return vim.fn.getcwd()
    end,
    settings = {
        -- formatterMode = 'typstfmt',
    },
})
