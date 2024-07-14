return {
    'folke/zen-mode.nvim',
    keys = {
        { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Zen Mode' },
    },
    opts = {
        window = {
            backdrop = 1,
            width = 0.7,
            height = 0.8,
            options = {
                signcolumn = 'no',
                number = false,
                relativenumber = false,
                cursorline = false,
                cursorcolumn = false,
                foldcolumn = '0',
                list = false,
            },
        },
        plugins = {
            gitsigns = { enabled = true },
        },
        on_open = function(win)
            vim.o.cmdheight = 1
            vim.b.miniindentscope_disable = true
            require('ibl').setup({
                enabled = false,
            })
        end,
        on_close = function()
            vim.o.cmdheight = 0
            vim.b.miniindentscope_disable = false
            require('ibl').setup({
                indent = {
                    char = '│',
                    repeat_linebreak = false,
                },
                scope = {
                    enabled = false,
                },
            })
        end,
    },
}
