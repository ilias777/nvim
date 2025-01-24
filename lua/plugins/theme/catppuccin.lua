local ucolors = require('catppuccin.utils.colors')

local catppuccin = require('catppuccin')

catppuccin.setup({
    transparent_background = true,
    styles = {
        keywords = { 'italic' },
        variables = { 'italic' },
        booleans = { 'italic' },
        properties = { 'italic' },
    },
    -- Integrations
    integrations = {
        blink_cmp = true,
        colorful_winsep = {
            enabled = true,
            color = 'red',
        },
        flash = true,
        grug_far = true,
        hop = true,
        lsp_trouble = true,
        mason = true,
        native_lsp = {
            enabled = true,
            underlines = {
                errors = { 'undercurl' },
                hints = { 'undercurl' },
                warnings = { 'undercurl' },
                information = { 'undercurl' },
            },
            inlay_hints = {
                background = false,
            },
        },
        navic = {
            enabled = true,
        },
        noice = true,
        notify = true,
        nvim_surround = true,
        nvimtree = false,
    },
    custom_highlights = function(colors)
        return {
            -- Identifier (like keyword require)
            -- ['@function.builtin'] = { fg = colors.flamingo },

            -- Variables
            -- ['@lsp.mod.global.lua'] = { fg = colors.red },

            -- Completion Menu
            -- Pmenu = { bg = colors.mantle },
            PmenuSel = { fg = colors.base, bg = colors.lavender, style = { 'bold', 'italic' } },

            -- Telescope
            -- TelescopeBorder = { fg = colors.blue },
            TelescopeSelectionCaret = { fg = colors.red },
            TelescopeSelection = { fg = colors.text, bg = colors.crust, style = { 'bold' } },
            TelescopeMatching = { fg = colors.red },
            TelescopePromptPrefix = { fg = colors.red, bg = colors.crust },
            TelescopePromptTitle = { fg = colors.crust, bg = colors.mauve, style = { 'bold', 'italic' } },
            TelescopePromptNormal = { bg = colors.crust },
            TelescopePromptBorder = { bg = colors.crust, fg = colors.crust },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopeResultsTitle = { fg = colors.crust, bg = colors.green, style = { 'bold', 'italic' } },
            TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopePreviewNormal = { bg = colors.crust },
            TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
            TelescopePreviewTitle = { fg = colors.crust, bg = colors.sapphire, style = { 'bold', 'italic' } },

            -- Bufferline
            BufferLineInfo = { fg = colors.surface0 },
            BufferLineInfoDiagnostic = { fg = colors.surface2 },
            BufferLineHint = { fg = colors.surface2 },
            BufferLineHintDiagnostic = { fg = colors.surface2 },
            BufferLineWarning = { fg = colors.surface2 },
            BufferLineWarningDiagnostic = { fg = colors.surface2 },
            BufferLineError = { fg = colors.surface2 },
            BufferLineErrorDiagnostic = { fg = colors.surface2 },
            BufferLineSeparator = { fg = colors.base, bg = colors.base },
            BufferLineSeparatorVisible = { fg = colors.base, bg = colors.base },
            BufferLineSeparatorSelected = { fg = colors.base, bg = colors.base },
            BufferLineTab = { fg = colors.overlay0 },
            BufferLineTabSeparator = { fg = colors.base, bg = colors.base },
            BufferLineTabSeparatorSelected = { fg = colors.base, bg = colors.base },
            BufferLineIndicatorSelected = { fg = colors.pink },
            BufferLineIndicator = { fg = colors.base },
            TabLineSel = { bg = colors.pink },
            -- BufferLineModifiedSelected = { fg = colors.teal },

            -- Folds
            -- Folded = { bg = colors.mantle },
            Folded = { bg = ucolors.darken(colors.peach, 0.1, colors.base) },

            -- Matching Parenthesis
            -- MatchParen = { style = { 'underline' } },
            -- MatchParen = { bg = colors.none },
            -- MatchParen = { fg = colors.base, bg = colors.red },
            -- MatchParen = { fg = colors.base, bg = ucolors.darken(colors.red, 0.65, colors.rosewater) },

            -- Inlay hints
            -- LspInlayHint = { bg = colors.mantle },

            -- Lsp diagnostic virtual text
            DiagnosticVirtualTextError = { bg = ucolors.darken(colors.red, 0.095, colors.base) },
            DiagnosticVirtualTextWarn = { bg = ucolors.darken(colors.yellow, 0.095, colors.base) },
            DiagnosticVirtualTextHint = { bg = ucolors.darken(colors.teal, 0.095, colors.base) },
            DiagnosticVirtualTextInfo = { bg = ucolors.darken(colors.sky, 0.095, colors.base) },

            -- Neotree
            NeoTreeRootName = { fg = colors.pink, style = { 'bold', 'italic' } },
            NeoTreeGitAdded = { fg = colors.green, style = { 'italic' } },
            NeoTreeGitConflict = { fg = colors.red, style = { 'italic' } },
            NeoTreeGitDeleted = { fg = colors.red, style = { 'italic' } },
            NeoTreeGitIgnored = { fg = colors.overlay0, style = { 'italic' } },
            NeoTreeGitModified = { fg = colors.yellow, style = { 'italic' } },
            NeoTreeGitUnstaged = { fg = colors.red, style = { 'italic' } },
            NeoTreeGitUntracked = { fg = colors.teal, style = { 'italic' } },
            NeoTreeGitStaged = { fg = colors.green, style = { 'italic' } },

            -- Dashboard.nvim
            DashboardHeader = { fg = colors.yellow, style = { 'bold', 'italic' } },

            -- Treesitter Context
            TreesitterContext = { bg = ucolors.darken(colors.base, 0.55, colors.mantle) },
            TreesitterContextBottom = { sp = colors.surface1 },
            TreesitterContextLineNumber = {
                fg = colors.rosewater,
                bg = ucolors.darken(colors.base, 0.55, colors.mantle),
            },

            -- Visual Mode
            Visual = { bg = ucolors.darken(colors.mauve, 0.15, colors.base) },

            -- Vim Visual Multi
            -- VM_Mono = { bg = ucolors.darken('#f38ba8', 0.15, colors.mantle), fg = colors.red, style = { 'bold' } },

            -- Noice CMDLine Popup
            -- NoiceCmdlinePopupBorder = { fg = colors.red },

            -- Gitsigns
            GitSignsStagedAdd = { fg = colors.blue },

            -- Search
            CurSearch = { bg = ucolors.darken(colors.lavender, 0.65, colors.base), fg = colors.mantle },

            -- Lazy.nvim
            LazyButton = { bg = colors.mantle },

            -- Mason
            MasonHeader = { bg = colors.mauve, fg = colors.mantle },
            MasonHighlightBlockBold = { bg = colors.blue, fg = colors.mantle },
            MasonMutedBlock = { bg = colors.surface0, fg = colors.text },

            -- blink.cmp
            BlinkCmpMenuBorder = { fg = colors.blue },
            BlinkCmpDocBorder = { fg = colors.sapphire },
            BlinkCmpSignatureHelpBorder = { fg = colors.yellow },
        }
    end,
    highlight_overrides = {},
    color_overrides = {
        latte = {
            rosewater = '#B5485E',
            flamingo = '#c64444',
            pink = '#d3008b',
            mauve = '#8839EF',
            red = '#c10000',
            maroon = '#550000',
            peach = '#975151',
            yellow = '#7b6200',
            green = '#005a32',
            teal = '#008080',
            sky = '#1987b2',
            sapphire = '#2e42b8',
            blue = '#034079',
            lavender = '#5a189a',
            text = '#4c5069',
            subtext1 = '#5c6077',
            subtext0 = '#6c6f85',
            overlay2 = '#7c7f93',
            overlay1 = '#8c8fa1',
            overlay0 = '#9ca0b0',
            surface2 = '#acb0be',
            surface1 = '#bcc0cc',
            surface0 = '#ccd0da',
            base = '#eff1f5',
            mantle = '#e6e9ef',
            crust = '#dce0e8',
        },
    },
})
