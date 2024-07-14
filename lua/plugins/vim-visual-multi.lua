return {
    'mg979/vim-visual-multi',
    keys = {
        { '<C-Up>' },
        { '<C-Down>' },
        { '<C-Left>' },
        { '<C-Right>' },
    },
    branch = 'master',
    init = function()
        vim.g.VM_maps = {
            ['Select l'] = '<C-Right>',
            ['Select h'] = '<C-Left>',
            ['I BS'] = '',
        }
        -- Themes: 'codedark' | 'iceblue' | 'purplegray' | 'nord' | 'sand' | 'ocean' | 'olive' | 'spacesray'
        -- vim.g.VM_theme = 'ocean'
    end,
}
