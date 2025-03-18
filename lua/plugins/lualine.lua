return {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local function get_colors()
            local background = vim.o.background
            if background == 'dark' then
                return require('catppuccin.palettes').get_palette('mocha')
            else
                return require('catppuccin.palettes').get_palette('latte')
            end
        end

        local colors = get_colors()
        local icon = require('lib.icons')

        local modecolor = {
            n = colors.red,
            i = colors.sapphire,
            v = colors.maroon,
            [''] = colors.maroon,
            V = colors.lavender,
            c = colors.yellow,
            no = colors.red,
            s = colors.yellow,
            S = colors.yellow,
            [''] = colors.yellow,
            ic = colors.yellow,
            R = colors.green,
            Rv = colors.maroon,
            cv = colors.red,
            ce = colors.red,
            r = colors.sapphire,
            rm = colors.sapphire,
            ['r?'] = colors.sapphire,
            ['!'] = colors.red,
            t = colors.red,
        }

        -- ─[ THEME ]────────────────────────────────────────────────
        local theme = {
            normal = {
                a = { fg = colors.base, bg = colors.blue },
                b = { fg = colors.blue, bg = colors.text },
                c = { fg = colors.text, bg = colors.base },
                z = { fg = colors.text, bg = colors.base },
            },
            insert = { a = { fg = colors.base, bg = colors.peach } },
            visual = { a = { fg = colors.base, bg = colors.green } },
            replace = { a = { fg = colors.base, bg = colors.green } },
        }

        -- ─[ SPACE ]────────────────────────────────────────────────
        local space = {
            function()
                return ' '
            end,
            color = { bg = colors.base, fg = colors.blue },
        }

        -- ─[ FILENAME ]─────────────────────────────────────────────
        local filename = {
            'filename',
            color = { bg = colors.blue, fg = colors.base, gui = 'bold' },
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
        }

        -- ─[ FILETYPE ]─────────────────────────────────────────────
        local filetype = {
            'filetype',
            icons_enabled = false,
            color = { bg = colors.crust, fg = colors.blue, gui = 'italic,bold' },
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
        }

        -- ─[ BRANCH ]───────────────────────────────────────────────
        local branch = {
            'branch',
            icon = '',
            color = { bg = colors.teal, fg = colors.base, gui = 'bold' },
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
        }

        -- ─[ LOCATION ]─────────────────────────────────────────────
        local location = {
            'location',
            color = { bg = colors.crust, fg = colors.yellow, gui = 'bold' },
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
        }

        -- ─[ DIFF ]─────────────────────────────────────────────────
        local diff = {
            'diff',
            color = { bg = colors.crust, fg = colors.green, gui = 'bold' },
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
            symbols = { added = icon.git.Add, modified = icon.git.Mod, removed = icon.git.Remove },

            diff_color = {
                added = { fg = colors.sky },
                modified = { fg = colors.yellow },
                removed = { fg = colors.red },
            },
        }

        -- ─[ MODES ]────────────────────────────────────────────────
        local modes = {
            'mode',
            color = function()
                local mode_color = modecolor
                return { bg = mode_color[vim.fn.mode()], fg = colors.mantle, gui = 'bold' }
            end,
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
        }

        -- ─[ LSP ]──────────────────────────────────────────────────
        local lsp_status = {
            'lsp_status',
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
            color = { bg = colors.peach, fg = colors.base, gui = 'italic,bold' },
        }

        local no_servers = {
            function()
                return '  No servers'
            end,
            cond = function()
                local bufnr = vim.api.nvim_get_current_buf()
                local buf_clients = vim.lsp.get_clients({ bufnr = bufnr })
                return next(buf_clients) == nil
            end,
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
            color = { bg = colors.peach, fg = colors.base, gui = 'italic,bold' },
        }

        -- ─[ LSP & FORMATTERS & LINTERS ]───────────────────────────
        local function getLspName()
            local bufnr = vim.api.nvim_get_current_buf()
            local buf_clients = vim.lsp.get_clients({ bufnr = bufnr })
            local buf_ft = vim.bo.filetype
            if next(buf_clients) == nil then
                return '  No servers'
            end
            local buf_client_names = {}

            for _, client in pairs(buf_clients) do
                if client.name ~= 'null-ls' then
                    table.insert(buf_client_names, client.name)
                end
            end

            local lint_s, lint = pcall(require, 'lint')
            if lint_s then
                for ft_k, ft_v in pairs(lint.linters_by_ft) do
                    if type(ft_v) == 'table' then
                        for _, linter in ipairs(ft_v) do
                            if buf_ft == ft_k then
                                table.insert(buf_client_names, linter)
                            end
                        end
                    elseif type(ft_v) == 'string' then
                        if buf_ft == ft_k then
                            table.insert(buf_client_names, ft_v)
                        end
                    end
                end
            end

            local ok, conform = pcall(require, 'conform')
            local formatters = table.concat(conform.list_formatters_for_buffer(), ' ')
            if ok then
                for formatter in formatters:gmatch('%w+') do
                    if formatter then
                        table.insert(buf_client_names, formatter)
                    end
                end
            end

            local hash = {}
            local unique_client_names = {}

            for _, v in ipairs(buf_client_names) do
                if not hash[v] then
                    unique_client_names[#unique_client_names + 1] = v
                    hash[v] = true
                end
            end
            local language_servers = table.concat(unique_client_names, ', ')

            return '  ' .. language_servers
        end

        local lsp = {
            function()
                return getLspName()
            end,
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
            color = { bg = colors.peach, fg = colors.base, gui = 'italic,bold' },
        }

        -- ─[ FORMATTERS & LINTERS ]─────────────────────────────────
        local function getFormatterAndLinter()
            local buf_ft = vim.bo.filetype
            local buf_client_names = {}

            local lint_s, lint = pcall(require, 'lint')
            if lint_s then
                for ft_k, ft_v in pairs(lint.linters_by_ft) do
                    if type(ft_v) == 'table' then
                        for _, linter in ipairs(ft_v) do
                            if buf_ft == ft_k then
                                table.insert(buf_client_names, linter)
                            end
                        end
                    elseif type(ft_v) == 'string' then
                        if buf_ft == ft_k then
                            table.insert(buf_client_names, ft_v)
                        end
                    end
                end
            end

            local ok, conform = pcall(require, 'conform')
            local formatters = table.concat(conform.list_formatters_for_buffer(), ' ')
            if ok then
                for formatter in formatters:gmatch('%w+') do
                    if formatter then
                        table.insert(buf_client_names, formatter)
                    end
                end
            end

            local hash = {}
            local unique_client_names = {}

            for _, v in ipairs(buf_client_names) do
                if not hash[v] then
                    unique_client_names[#unique_client_names + 1] = v
                    hash[v] = true
                end
            end
            local formatters_linters = table.concat(unique_client_names, ', ')

            if formatters_linters == '' then
                return ''
            else
                return '  ' .. formatters_linters
            end
        end

        local formatters_linters = {
            function()
                return getFormatterAndLinter()
            end,
            color = { bg = colors.crust, fg = colors.yellow, gui = 'italic,bold' },
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
        }

        -- ─[ MODES NOICE ]──────────────────────────────────────────
        local modes_noice = {
            require('noice').api.status.mode.get,
            cond = require('noice').api.status.mode.has,
            color = { fg = colors.red, bg = colors.base, gui = 'italic,bold' },
        }

        -- ─[ MACRO ]────────────────────────────────────────────────
        local function check_macro()
            local recording_register = vim.fn.reg_recording()
            if recording_register == '' then
                return ''
            else
                return 'recording @' .. recording_register
            end
        end

        local macro = {
            function()
                return check_macro()
            end,
            color = { fg = colors.red, bg = colors.base, gui = 'italic,bold' },
        }

        -- ─[ LAZY UPDATES ]─────────────────────────────────────────
        local lazy_updates = {
            require('lazy.status').updates,
            cond = require('lazy.status').has_updates,
            on_click = function()
                vim.cmd('Lazy')
            end,
            color = { fg = colors.pink, bg = colors.crust },
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
        }

        -- ─[ MASON ]────────────────────────────────────────────────
        local function lualine_mason_updates()
            local registry = require('mason-registry')
            local installed_packages = registry.get_installed_package_names()
            local upgrades_available = false
            local packages_outdated = 0
            function myCallback(success, result_or_err)
                if success then
                    upgrades_available = true
                    packages_outdated = packages_outdated + 1
                end
            end

            for _, pkg in pairs(installed_packages) do
                local p = registry.get_package(pkg)
                if p then
                    p:check_new_version(myCallback)
                end
            end

            if upgrades_available then
                return packages_outdated
            else
                return ''
            end
        end

        local mason_updates = {
            lualine_mason_updates,
            icon = ' ',
            on_click = function()
                vim.cmd('Mason')
            end,
            color = { fg = colors.green, bg = colors.crust },
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
        }

        -- ─[ DIAGNOSTICS ]──────────────────────────────────────────
        local dia = {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.maroon },
                hint = { fg = colors.sapphire },
            },
            color = { bg = colors.crust, fg = colors.blue, gui = 'bold' },
            separator = { left = icon.ui.PowerlineLeftRounded, right = icon.ui.PowerlineRightRounded },
        }

        require('lualine').setup({
            options = {
                disabled_filetypes = {
                    statusline = {
                        'lazy',
                        'mason',
                        'checkhealth',
                        'dashboard',
                        'TelescopePrompt',
                        'snipe-menu',
                    },
                },
                icons_enabled = true,
                theme = theme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                ignore_focus = {
                    'neo-tree',
                    'Outline',
                    'SymbolsSidebar',
                    'qf',
                    'trouble',
                },
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    modes,
                },
                lualine_b = {
                    space,
                },
                lualine_c = {
                    filename,
                    filetype,
                    space,
                    branch,
                    diff,
                    space,
                    location,
                },
                lualine_x = {
                    space,
                },
                lualine_y = {
                    macro,
                    space,
                },
                lualine_z = {
                    dia,
                    space,
                    lazy_updates,
                    space,
                    mason_updates,
                    space,
                    -- lsp,
                    lsp_status,
                    no_servers,
                    formatters_linters,
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
