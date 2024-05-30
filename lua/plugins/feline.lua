return {
    'freddiehaddad/feline.nvim',
    event = 'VeryLazy',
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
                file = '󰈙 ',
                lsp = {
                    server = '󰒋 ',
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
            view = {
                lsp = {
                    progress = true, -- if true the status bar will display an lsp progress indicator
                    name = true, -- if true the status bar will display the lsp servers name, otherwise it will display the text "Lsp"
                    exclude_lsp_names = {}, -- lsp server names that should not be displayed when name is set to true
                    separator = '|', -- the separator used when there are multiple lsp servers
                },
            },
        })

        require('feline').setup({
            components = ctp_feline.get(),
            force_inactive = {
                filetypes = {
                    '^packer$',
                    '^NvimTree$',
                    '^trouble$',
                    '^Outline$',
                    '^qf$',
                    '^help$',
                    '^TelescopePrompt$',
                    '^git$',
                    '^dapui_scopes$',
                    '^dapui_breakpoints$',
                    '^dapui_stacks$',
                    '^dapui_watches$',
                    '^dapui_repl$',
                    '^dap%-repl$',
                    '^dapui_console$',
                    '^lspinfo$',
                    '^mason$',
                    '^lazy$',
                    '^Codewindow$',
                    '^JABSwindow$',
                    '^neo%-tree$',
                },
                buftypes = {
                    'terminal',
                },
                bufnames = {},
            },
        })
    end,
}
