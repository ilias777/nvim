--  ╭──────────────────────────────────────────────────────────╮
--  │                    LSP CONFIGURATION                     │
--  ╰──────────────────────────────────────────────────────────╯
return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufReadPost', 'BufNewFile' },
    -- depedencies = { 'saghen/blink.cmp' },
    config = function()
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
                height = 0.8,
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
                'ruff',
                'rust_analyzer',
                'texlab',
                'ts_ls',
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
        -- lsp_defaults.capabilities =
        --     vim.tbl_deep_extend('force', lsp_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())
        lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('blink.cmp').get_lsp_capabilities(lsp_defaults.capabilities)
        )

        -- ╭─────────────────────────────────╮
        -- │ LSP BORDER FOR :LSPINFO COMMAND │
        -- ╰─────────────────────────────────╯
        require('lspconfig.ui.windows').default_options.border = 'single'

        -- ╭───────────────────╮
        -- │ WINBAR WITH NAVIC │
        -- ╰───────────────────╯
        local navic = require('nvim-navic')

        -- ╭─────────────────────────────────────────────────────────╮
        -- │                   DIAGNOSTIC KAYMAPS                    │
        -- ╰─────────────────────────────────────────────────────────╯
        local opts = function(desc)
            return { noremap = true, silent = true, desc = desc }
        end

        vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts('Open Diagnostic Window'))
        vim.keymap.set('n', '<space><left>', function()
            vim.diagnostic.jump({ count = -vim.v.count1 })
        end, opts('Previous Diagnostic'))
        vim.keymap.set('n', '<space><right>', function()
            vim.diagnostic.jump({ count = vim.v.count1 })
        end, opts('Next Diagnostic'))
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts('Send Diagnostic to Locallist'))

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
                    return { buffer = ev.buf, desc = desc }
                end
                -- All lsp keymaps starts with gr expept K.
                -- Default lsp keymaps. Setting the keymaps again, only to change the description.
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts('Hover'))
                vim.keymap.set({ 'n', 'v' }, 'gra', vim.lsp.buf.code_action, bufopts('LSP Code Action'))
                vim.keymap.set('n', 'grn', vim.lsp.buf.rename, bufopts('LSP Rename'))
                vim.keymap.set('n', 'grr', vim.lsp.buf.references, bufopts('LSP References'))
                -- Custom lsp keymaps.
                vim.keymap.set('n', 'grd', vim.lsp.buf.definition, bufopts('LSP Go to Definition'))
                vim.keymap.set('n', 'grD', vim.lsp.buf.declaration, bufopts('LSP Go to Declaration'))
                vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, bufopts('LSP Go to Implementation'))
                vim.keymap.set('n', 'grf', function()
                    vim.lsp.buf.format({ async = true })
                end, bufopts('LSP Formatting'))
                vim.keymap.set('n', 'grk', vim.lsp.buf.signature_help, bufopts('LSP Singature Help'))
                vim.keymap.set('n', 'grs', vim.lsp.buf.document_symbol, bufopts('LSP Document Symbols'))
                vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition, bufopts('LSP Type Definition'))
                vim.keymap.set('n', 'grwa', vim.lsp.buf.add_workspace_folder, bufopts('LSP Add Workspace Folder'))
                vim.keymap.set('n', 'grwr', vim.lsp.buf.remove_workspace_folder, bufopts('LSP Remove Workspace Folder'))
                vim.keymap.set('n', 'grwl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts('LSP List Workspace Folder'))

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
        -- │ DIAGNOSTIC CONFIG │
        -- ╰───────────────────╯
        vim.diagnostic.config({
            virtual_text = {
                prefix = '', -- Could be '●', '▎', │, 'x', '■', , 
            },
            jump = {
                float = true,
            },
            float = { border = 'single' },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = ' ',
                    [vim.diagnostic.severity.WARN] = ' ',
                    [vim.diagnostic.severity.HINT] = '󰌶 ',
                    [vim.diagnostic.severity.INFO] = ' ',
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
                    [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
                    [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
                    [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
                },
            },
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
        lspconfig.ts_ls.setup({
            handlers = handlers,
            init_options = {
                plugins = {
                    {
                        name = '@/vue/typescript-plugin',
                        location = '/Users/ilias/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server',
                        languages = { 'vue' },
                    },
                },
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
            -- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
            -- on_attach = function(client, bufnr)
            --     client.server_capabilities.document_formatting = false
            --     client.server_capabilities.document_range_formatting = false
            --     on_attach(client, bufnr)
            -- end,
        })

        -- ╭──────────────────╮
        -- │ VOLAR VUE SERVER │
        -- ╰──────────────────╯
        lspconfig.volar.setup({
            handlers = handlers,
            init_options = {
                typescript = {
                    tsdk = '/Users/ilias/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib',
                },
                vue = {
                    hybridMode = false,
                },
            },
        })

        -- ╭───────────────╮
        -- │ PYTHON SERVER │
        -- ╰───────────────╯
        lspconfig.ruff.setup({
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
        lspconfig.tailwindcss.setup({
            handlers = handlers,
            settings = {
                tailwindCSS = {
                    classAttributes = { 'class', 'className', 'class:list', 'classList', 'ngClass' },
                    includeLanguages = {
                        eelixir = 'html-eex',
                        eruby = 'erb',
                        htmlangular = 'html',
                        templ = 'html',
                    },
                    lint = {
                        cssConflict = 'warning',
                        invalidApply = 'error',
                        invalidConfigPath = 'error',
                        invalidScreen = 'error',
                        invalidTailwindDirective = 'error',
                        invalidVariant = 'error',
                        recommendedVariantOrder = 'warning',
                    },
                    validate = true,
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
                -- ltex = {
                --     language = 'de-DE',
                -- },
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
        lspconfig.jdtls.setup({
            handlers = handlers,
        })

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
        lspconfig.tinymist.setup({
            handlers = handlers,
            single_file_support = true,
            root_dir = function()
                return vim.fn.getcwd()
            end,
            settings = {
                formatterMode = 'typstyle',
            },
        })
    end,
}
