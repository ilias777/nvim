return {
    'akinsho/bufferline.nvim',
    event = 'BufReadPre',
    version = 'v3.*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup({
            options = {
                mode = 'buffers', -- set to "tabs" to only show tabpages instead | "buffers"
                numbers = 'none', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string
                close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
                right_mouse_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
                left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
                middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
                indicator = {
                    icon = '▎',
                    style = 'icon', -- 'icon' | 'underline' | 'none'
                },
                buffer_close_icon = '',
                modified_icon = '',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                --- name_formatter can be used to change the buffer's label in the bufferline.
                --- Please note some names can/will break the
                --- bufferline so use this at your discretion knowing that it has
                --- some limitations that will *NOT* be fixed.
                name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
                    -- remove extension from markdown files for example
                    if buf.name:match('%.md') then
                        return vim.fn.fnamemodify(buf.name, ':t:r')
                    end
                end,
                max_name_length = 18,
                max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                truncate_names = true, -- whether or not tab names should be truncated
                tab_size = 20,
                diagnostics = 'false', -- | "nvim_lsp" | false
                diagnostics_update_in_insert = false,
                -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    return '(' .. count .. ')'
                end,
                offsets = {
                    {
                        filetype = 'NvimTree',
                        text = 'פּ File Explorer',
                        text_align = 'center', -- | 'left' | 'center' | 'right'
                        separator = true,
                    },
                },
                color_icons = true, -- | false
                show_buffer_icons = true, -- | false
                show_buffer_close_icons = true, -- | false
                show_buffer_default_icon = true, -- | false
                show_close_icon = true, -- | false
                show_tab_indicators = true, -- | false
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                -- can also be a table containing 2 custom separators
                -- [focused and unfocused]. eg: { '|', '|' }
                separator_style = 'thin', -- | "thick" | "thin" | "slant" { 'any', 'any' }
                enforce_regular_tabs = false, -- | true, false
                always_show_bufferline = true, -- | false
                hover = {
                    enabled = false,
                    delay = 200,
                    reveal = { 'close' },
                },
                -- sort_by = 'insert_after_current' -- |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
                -- add custom logic
                --   return buffer_a.modified > buffer_b.modified
                -- end
                groups = {
                    items = {
                        require('bufferline.groups').builtin.pinned:with({ icon = '' }),
                    },
                },
            },
            highlights = require('catppuccin.groups.integrations.bufferline').get(),
            -- highlights = require('rose-pine.plugins.bufferline'),
        })
    end,
}
