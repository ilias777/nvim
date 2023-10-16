return {
    'akinsho/bufferline.nvim',
    event = 'VimEnter',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local mocha = require('catppuccin.palettes').get_palette('mocha')
        require('bufferline').setup({
            options = {
                -- indicator = {
                --     icon = '▎',
                --     style = 'icon', -- 'icon' | 'underline' | 'none'
                -- },
                -- name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
                --     -- remove extension from markdown files for example
                --     if buf.name:match('%.md') then
                --         return vim.fn.fnamemodify(buf.name, ':t:r')
                --     end
                -- end,
                tab_size = 20,
                diagnostics = 'nvim_lsp',
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local ret = (diagnostics_dict.error and ' ' .. diagnostics_dict.error .. ' ' or '') .. (diagnostics_dict.warning and ' ' .. diagnostics_dict.warning or '')
                    return vim.trim(ret)
                end,
                ---@type 'thin' | 'thick' | 'slant' | 'padded_slant' | 'slope' | 'padded_slope'
                separator_style = 'thin',
                groups = {
                    options = {
                        toggle_hidden_on_enter = true,
                    },
                    items = {
                        require('bufferline.groups').builtin.pinned:with({ icon = '' }),
                    },
                },
            },
            highlights = require('catppuccin.groups.integrations.bufferline').get({
                custom = {
                    all = {
                        -- -- Fill
                        -- fill = { bg = 'NONE' },
                        -- -- Background
                        -- background = { bg = 'NONE' },
                        -- -- Separator
                        -- separator = { bg = 'NONE' },
                        -- -- Close button
                        -- close_button = { bg = 'NONE' },
                        -- -- Duplicate
                        -- duplicate = { bg = 'NONE' },
                        -- -- Modified
                        -- modified = { bg = 'NONE' },
                        -- -- Diagnostics
                        -- diagnostic = { bg = 'NONE' },
                        -- diagnostic_visible = { bg = 'NONE' },
                        -- diagnostic_selected = { bg = 'NONE' },
                        -- -- Errors
                        -- ---@diagnostic disable: need-check-nil
                        -- error = { fg = mocha.surface1, bg = 'NONE' },
                        -- error_visible = { fg = mocha.surface1, bg = 'NONE' },
                        -- error_selected = { bg = 'NONE' },
                        -- error_diagnostic = { fg = mocha.surface1, bg = 'NONE' },
                        -- error_diagnostic_visible = { fg = mocha.surface1, bg = 'NONE' },
                        -- error_diagnostic_selected = { bg = 'NONE' },
                        -- -- Warnings
                        -- warning = { fg = mocha.surface1, bg = 'NONE' },
                        -- warning_visible = { fg = mocha.surface1, bg = 'NONE' },
                        -- warning_selected = { bg = 'NONE' },
                        -- warning_diagnostic = { fg = mocha.surface1, bg = 'NONE' },
                        -- warning_diagnostic_visible = { fg = mocha.surface1, bg = 'NONE' },
                        -- warning_diagnostic_selected = { bg = 'NONE' },
                        -- -- Info
                        -- info = { fg = mocha.surface1, bg = 'NONE' },
                        -- info_visible = { fg = mocha.surface1, bg = 'NONE' },
                        -- info_selected = { bg = 'NONE' },
                        -- info_diagnostic = { fg = mocha.surface1, bg = 'NONE' },
                        -- info_diagnostic_visible = { fg = mocha.surface1, bg = 'NONE' },
                        -- info_diagnostic_selected = { bg = 'NONE' },
                        -- -- Hint
                        -- hint = { fg = mocha.surface1, bg = 'NONE' },
                        -- hint_visible = { fg = mocha.surface1, bg = 'NONE' },
                        -- hint_selected = { bg = 'NONE' },
                        -- hint_diagnostic = { fg = mocha.surface1, bg = 'NONE' },
                        -- hint_diagnostic_visible = { fg = mocha.surface1, bg = 'NONE' },
                        -- hint_diagnostic_selected = { bg = 'NONE' },
                    },
                },
            }),
            -- highlights = require('rose-pine.plugins.bufferline'),
        })
    end,
}
