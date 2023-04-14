return {
    'narutoxy/silicon.lua',
    enabled = false,
    keys = {
        { '<leader>4' },
        { '<leader>5' },
        { '<leader>6' },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local silicon = require('silicon')

        silicon.setup({
            theme = 'catppuccin',
            output = string.format('~/Desktop/SILICON_%s-%s-%s_%s-%s.png', os.date('%Y'), os.date('%m'), os.date('%d'), os.date('%H'), os.date('%M')),
            -- bgColor = vim.g.terminal_color_1,
            bgColor = '#3300',
            bgImage = '', -- path to image, must be png
            roundCorner = true,
            windowControls = true,
            lineNumber = true,
            font = 'Cascadia Code',
            lineOffset = 1, -- from where to start line number
            -- lineOffset = vim.fn.getcurpos(0)[2],
            linePad = 5, -- padding between lines
            padHoriz = 80, -- Horizontal padding
            padVert = 100, -- vertical padding
            shadowBlurRadius = 10,
            shadowColor = '#555555',
            shadowOffsetX = 8,
            shadowOffsetY = 8,
            gobble = false, -- enable lsautogobble like feature
            debug = false, -- enable debug output
        })

        vim.keymap.set('v', '<leader>4', function()
            silicon.visualise_api({})
        end, { desc = 'Snap selected snippet' })

        vim.keymap.set('n', '<leader>5', function()
            silicon.visualise_api({ show_buf = true })
        end, { desc = 'Snap buffer' })

        vim.keymap.set('n', '<leader>6', function()
            vim.cmd('source ~/.config/nvim/lua/plugins/silicon.lua')
            vim.cmd('lua vim.notify("Silicon Source", "info")')
        end, { desc = 'Source silicon.lua' })

        -- === USAGE === --
        -- Images of selected snippet:
        -- lua require("silicon").visualise_api({})

        -- Images of whole buffer with the selected snippet being highlighted by lighter background:
        -- lua require("silicon").visualise_api({show_buf = true})

        -- Copy the image of snippet to clipboard:
        -- lua require("silicon").visualise_api({to_clip = true})
    end,
}
