return {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    version = '*',
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
                    local ret = (diagnostics_dict.error and ' ' .. diagnostics_dict.error .. ' ' or '') .. (diagnostics_dict.warning and ' ' .. diagnostics_dict.warning or '') .. (diagnostics_dict.hint and ' ' .. diagnostics_dict.hint .. ' ' or '')
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
                        ---@diagnostic disable: need-check-nil
                        info = { fg = mocha.surface2 },
                        info_diagnostic = { fg = mocha.surface2 },
                        hint = { fg = mocha.surface2 },
                        hint_diagnostic = { fg = mocha.surface2 },
                        warning = { fg = mocha.surface2 },
                        warning_diagnostic = { fg = mocha.surface2 },
                        error = { fg = mocha.surface2 },
                        error_diagnostic = { fg = mocha.surface2 },
                    },
                },
            }),
            -- highlights = require('rose-pine.plugins.bufferline'),
        })
    end,
}
