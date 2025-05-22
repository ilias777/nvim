return {
    'chrisgrieser/nvim-spider',
    event = 'BufReadPost',
    config = function()
        -- Keymaps
        vim.keymap.set({ 'n', 'o', 'x' }, 'w', function()
            require('spider').motion('w')
        end, { desc = 'Spider-w' })
        vim.keymap.set({ 'n', 'o', 'x' }, 'e', function()
            require('spider').motion('e')
        end, { desc = 'Spider-e' })
        vim.keymap.set({ 'n', 'o', 'x' }, 'b', function()
            require('spider').motion('b')
        end, { desc = 'Spider-b' })
        vim.keymap.set({ 'n', 'o', 'x' }, 'ge', function()
            require('spider').motion('ge')
        end, { desc = 'Spider-ge' })
    end,
}
