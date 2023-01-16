return {
    'feline-nvim/feline.nvim',
    config = function()
        local ctp_feline = require('catppuccin.groups.integrations.feline')
        local clrs = require('catppuccin.palettes').get_palette()

        ctp_feline.setup({
            assets = {
                left_separator = '',
                right_separator = '',
                bar = '█',
                mode_icon = '',
                dir = '  ',
                file = '   ',
                lsp = {
                    server = ' 力',
                    error = '  ',
                    warning = '  ',
                    info = '  ',
                    hint = '  ',
                },
                git = {
                    -- icons:   
                    branch = '  ',
                    added = '  ',
                    changed = '  ',
                    removed = '  ',
                },
            },
            mode_colors = {
                ['n'] = { 'NORMAL', clrs.teal },
                ['no'] = { 'N-PENDING', clrs.lavender },
                ['i'] = { 'INSERT', clrs.green },
                ['ic'] = { 'INSERT', clrs.green },
                ['t'] = { 'TERMINAL', clrs.green },
                ['v'] = { 'VISUAL', clrs.flamingo },
                ['V'] = { 'V-LINE', clrs.flamingo },
                ['^V'] = { 'V-BLOCK', clrs.flamingo },
                ['R'] = { 'REPLACE', clrs.maroon },
                ['Rv'] = { 'V-REPLACE', clrs.maroon },
                ['s'] = { 'SELECT', clrs.maroon },
                ['S'] = { 'S-LINE', clrs.maroon },
                ['^S'] = { 'S-BLOCK', clrs.maroon },
                ['c'] = { 'COMMAND', clrs.peach },
                ['cv'] = { 'COMMAND', clrs.peach },
                ['ce'] = { 'COMMAND', clrs.peach },
                ['r'] = { 'PROMPT', clrs.teal },
                ['rm'] = { 'MORE', clrs.teal },
                ['r?'] = { 'CONFIRM', clrs.mauve },
                ['!'] = { 'SHELL', clrs.green },
            },
        })

        require('feline').setup({
            components = ctp_feline.get(),
            force_inactive = {
                filetypes = {
                    'packer',
                    'NvimTree',
                    'Trouble',
                    'Outline',
                    'qf',
                    'help',
                    'TelescopePrompt',
                    'git',
                    'dapui_scopes',
                    'dapui_breakpoints',
                    'dapui_stacks',
                    'dapui_watches',
                    'dapui_repl',
                    'dap-repl',
                    'dapui_console',
                    'lspinfo',
                    'Codewindow',
                    'JABSwindow',
                },
                buftypes = { --[[ 'terminal' ]]
                },
                bufnames = {},
            },
        })
    end,
}
