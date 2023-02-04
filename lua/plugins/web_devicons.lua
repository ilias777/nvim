return {
    'nvim-tree/nvim-web-devicons',
    event = 'BufEnter',
    config = function()
        require('nvim-web-devicons').set_icon({
            toc = {
                icon = '',
                color = '#dee0cd',
                cterm_color = '86',
                name = 'Toc',
            },
            bib = {
                icon = '',
                color = '#d78700',
                cterm_color = '172',
                name = 'Bib',
            },
            vue = {
                icon = '﵂',
                color = '#40b883',
                cterm_color = '42',
                name = 'Vue',
            },
        })
    end,
}
