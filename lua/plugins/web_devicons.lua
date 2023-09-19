return {
    'nvim-tree/nvim-web-devicons',
    event = 'BufEnter',
    config = function()
        require('nvim-web-devicons').set_icon({
            toc = {
                icon = '󰎟',
                color = '#dee0cd',
                cterm_color = '86',
                name = 'Toc',
            },
            bib = {
                icon = '󰌱',
                color = '#d78700',
                cterm_color = '172',
                name = 'Bib',
            },
            -- vue = {
            --     icon = '󰡄',
            --     color = '#00d75f',
            --     cterm_color = '41',
            --     name = 'Vue',
            -- },
        })
    end,
}
