return {
    'nvim-tree/nvim-web-devicons',
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
        })
    end,
}
