return {
    'akinsho/bufferline.nvim',
    event = 'VimEnter',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup({
            ---@diagnostic disable-next-line missing-fields
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
                ---@type 'thin' | 'thick' | 'slant'
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
                        fill = { bg = 'NONE' },
                        background = { bg = 'NONE' },
                        separator = { bg = 'NONE' },
                        close_button = { bg = 'NONE' },
                        duplicate = { bg = 'NONE' },
                        modified = { bg = 'NONE' },
                    },
                },
            }),
            -- highlights = require('rose-pine.plugins.bufferline'),
        })
    end,
}
