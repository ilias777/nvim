return {
    'freddiehaddad/feline.nvim',
    event = 'VimEnter',
    config = function()
        local mocha = require('catppuccin.palettes').get_palette('mocha')
        local ctp_feline = require('catppuccin.groups.integrations.feline')
        local clrs = require('catppuccin.palettes').get_palette()
        local U = require('catppuccin.utils.colors')

        ctp_feline.setup({
            assets = {
                left_separator = '',
                right_separator = '',
                mode_icon = '',
                dir = '',
                file = '',
                lsp = {
                    server = '力',
                    error = '',
                    warning = '',
                    info = '',
                    hint = '',
                },
                git = {
                    -- icons:   
                    branch = '',
                    added = '',
                    changed = '',
                    removed = '',
                },
            },
            -- sett = {
            --     text = U.vary_color({ mocha = mocha.surface0 }, clrs.surface0),
            --     bkg = U.vary_color({ mocha = 'NONE' }, clrs.surface0),
            --     diffs = clrs.mauve,
            --     extras = clrs.overlay1,
            --     curr_file = clrs.maroon,
            --     curr_dir = clrs.flamingo,
            --     show_modified = false, -- show if the file has been modified
            -- },
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
                    'mason',
                    'lazy',
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
