return {
    'MagicDuck/grug-far.nvim',
    config = function()
        require('grug-far').setup({
            windowCreationCommand = 'tabnew %',
        })
    end,
}
