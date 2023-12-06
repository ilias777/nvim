return {
    'luukvbaal/statuscol.nvim',
    event = 'BufReadPre',
    config = function()
        local builtin = require('statuscol.builtin')
        require('statuscol').setup({
            relculright = true,
            segments = {
                { sign = { name = { 'Dap' }, maxwidth = 1, auto = false }, click = 'v:lua.ScSa' },
                {
                    sign = { namespace = { 'gitsigns*' }, maxwidth = 1, colwidth = 1, auto = false },
                    click = 'v:lua.ScSa',
                },
                { sign = { name = { 'Diagnostic' }, maxwidth = 1, auto = false }, click = 'v:lua.ScSa' },
                { text = { builtin.lnumfunc, '  ' }, click = 'v:lua.ScLa' },
                { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
            },
        })
    end,
}
