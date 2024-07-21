return {
    'mg979/vim-visual-multi',
    branch = 'master',
    event = 'VeryLazy',
    keys = {
        { 'cp', 'vip<Plug>(VM-Visual-Cursors)', desc = 'Create multicursors inner paragraph' },
        { '<M-s>', ':VMSearch', mode = 'x', desc = 'Search & create multicursors in visual mode' },
        { '<M-s>', ':%VMSearch', desc = 'Search & create multicursors' },
        { '<M-c>', '<Plug>(VM-Visual-Cursors)', mode = 'x', desc = 'Create multicursors in visual mode' },
    },
    init = function()
        vim.g.VM_maps = {
            ['Motion ,'] = '',
            ['Select l'] = '<C-Right>',
            ['Select h'] = '<C-Left>',
            ['Goto Next'] = '',
            ['Goto Prev'] = '',
            ['I BS'] = '',
        }
        -- Themes: 'codedark' | 'iceblue' | 'purplegray' | 'nord' | 'sand' | 'ocean' | 'olive' | 'spacesray'
        -- vim.g.VM_theme = 'ocean'
    end,
}
