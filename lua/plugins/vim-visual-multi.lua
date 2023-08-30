return {
    'mg979/vim-visual-multi',
    event = 'BufReadPost',
    branch = 'master',
    init = function()
        vim.g.VM_maps = {
            ['Select l'] = '<C-Right>',
            ['Select h'] = '<C-Left>',
        }
    end,
}
