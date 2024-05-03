return {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
    config = function()
        require('nvim-web-devicons').set_icon({
            toc = {
                icon = '󰎟',
                color = '#dee0cd',
                cterm_color = '86',
                name = 'Toc',
            },
            typ = {
                icon = 't',
                color = '#239DAD',
                cterm_color = '45',
                name = 'Typst',
            },
        })
    end,
}
