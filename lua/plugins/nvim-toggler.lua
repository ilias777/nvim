local keymap = require('utils.set_keymap')

return {
    'nguyenvukhang/nvim-toggler',
    keys = {
        { '<leader>w', desc = 'Toggle Word' },
    },
    config = function()
        require('nvim-toggler').setup({
            remove_default_keybinds = true,
        })
        keymap.set({
            mode = { 'n', 'v' },
            key = '<leader>w',
            cmd = require('nvim-toggler').toggle,
            desc = 'Toggle a Word',
        })
    end,
}
