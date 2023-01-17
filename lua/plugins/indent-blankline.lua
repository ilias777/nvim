return {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    config = function()
        vim.cmd([[highlight IndentBlanklineIndent1 guifg=#f0c6c6 gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent2 guifg=#c6a0f6 gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent3 guifg=#ee99a0 gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent4 guifg=#b7bdf8 gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent5 guifg=#8bd5ca gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent6 guifg=#b8c0e0 gui=nocombine]])

        require('indent_blankline').setup({
            space_char_blankline = ' ',
            show_current_context = false,
            show_current_context_start = false,
            filetype_exclude = {
                'NvimTree',
                'dashboard',
                'help',
                'lspinfo',
                'LspInstallerInfo',
                'packer',
            },
            char_highlight_list = {
                -- 'IndentBlanklineIndent1',
                -- 'IndentBlanklineIndent2',
                -- 'IndentBlanklineIndent3',
                -- 'IndentBlanklineIndent4',
                -- 'IndentBlanklineIndent5',
                -- 'IndentBlanklineIndent6',
            },
        })
    end,
}
