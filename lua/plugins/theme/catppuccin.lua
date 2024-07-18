local ucolors = require('catppuccin.utils.colors')
local mocha = require('catppuccin.palettes').get_palette('mocha')

-- vim.g.catppuccin_flavour = 'mocha'

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
        hop = true,
        lsp_trouble = true,
        mason = true,
        noice = true,
        notify = true,
        nvimtree = false,
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
        flash = true,
        colorful_winsep = {
            enabled = true,
            color = 'red',
        },
    },
    custom_highlights = function(colors)
        return {
            -- Identifier (like keyword require)
            ['@function.builtin'] = { fg = colors.flamingo },

            -- Variables
            ['@lsp.mod.global.lua'] = { fg = colors.red },

            -- Cmp Menu
            -- Pmenu = { bg = colors.mantle },
            -- PmenuSel = { fg = colors.mantle, bg = colors.maroon, style = { 'bold' } },
            -- Pmenu = { bg = colors.base },
            PmenuSel = { fg = colors.base, bg = colors.maroon, style = { 'bold' } },

            -- Cmp Item Kind
            -- CmpItemAbbrDeprecated = { fg = colors.overlay1, bg = 'NONE', strikethrough = true },
            -- CmpItemAbbrMatch = { fg = colors.blue, bg = 'NONE', bold = true },
            -- CmpItemAbbrMatchFuzzy = { fg = colors.blue, bg = 'NONE', bold = true },
            -- CmpItemMenu = { fg = colors.pink, bg = 'NONE', italic = true },
            --
            -- CmpItemKindField = { fg = colors.surface1, bg = colors.red },
            -- CmpItemKindProperty = { fg = colors.surface1, bg = colors.red },
            -- CmpItemKindEvent = { fg = colors.surface1, bg = colors.red },
            --
            -- CmpItemKindText = { fg = colors.mantle, bg = colors.green },
            -- CmpItemKindEnum = { fg = colors.mantle, bg = colors.green },
            -- CmpItemKindKeyword = { fg = colors.mantle, bg = colors.green },
            --
            -- CmpItemKindConstant = { fg = colors.mantle, bg = colors.yellow },
            -- CmpItemKindConstructor = { fg = colors.mantle, bg = colors.yellow },
            -- CmpItemKindReference = { fg = colors.mantle, bg = colors.yellow },
            --
            -- CmpItemKindFunction = { fg = colors.mantle, bg = colors.pink },
            -- CmpItemKindStruct = { fg = colors.mantle, bg = colors.pink },
            -- CmpItemKindClass = { fg = colors.mantle, bg = colors.pink },
            -- CmpItemKindModule = { fg = colors.mantle, bg = colors.pink },
            -- CmpItemKindOperator = { fg = colors.mantle, bg = colors.pink },
            --
            -- CmpItemKindVariable = { fg = colors.subtext1, bg = colors.surface0 },
            -- CmpItemKindFile = { fg = colors.subtext1, bg = colors.surface0 },
            --
            -- CmpItemKindUnit = { fg = colors.mantle, bg = colors.maroon },
            -- CmpItemKindSnippet = { fg = colors.mantle, bg = colors.maroon },
            -- CmpItemKindFolder = { fg = colors.mantle, bg = colors.maroon },
            --
            -- CmpItemKindMethod = { fg = colors.mantle, bg = colors.sapphire },
            -- CmpItemKindValue = { fg = colors.mantle, bg = colors.sapphire },
            -- CmpItemKindEnumMember = { fg = colors.mantle, bg = colors.sapphire },
            --
            -- CmpItemKindInterface = { fg = colors.surface0, bg = colors.peach },
            -- CmpItemKindColor = { fg = colors.surface0, bg = colors.peach },
            -- CmpItemKindTypeParameter = { fg = colors.surface0, bg = colors.peach },

            -- Telescope
            TelescopeBorder = { fg = colors.blue },
            TelescopeSelectionCaret = { fg = colors.red },
            TelescopeSelection = { fg = colors.yellow, bg = colors.surface0, style = { 'bold' } },
            TelescopeMatching = { fg = colors.blue },
            TelescopePromptPrefix = { fg = colors.yellow, bg = colors.crust },
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

            -- Cursorline & Linenumbers
            CursorLine = { bg = colors.mantle },
            Cursor = { bg = colors.red },

            -- Folds
            -- Folded = { bg = colors.mantle },
            Folded = { bg = ucolors.darken('#f9e2af', 0.1, mocha.mantle) },

            -- Matching Parenthesis
            -- MatchParen = { style = { 'underline' } },
            -- MatchParen = { bg = colors.none },
            -- MatchParen = { fg = colors.base, bg = colors.red },
            -- MatchParen = { fg = colors.base, bg = ucolors.darken(colors.red, 0.65, mocha.rosewater) },

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

            -- Nvimtree
            -- NvimTreeRootFolder = { fg = colors.pink, style = { 'bold', 'italic' } },
            -- NvimTreeGitNew = { fg = colors.green, style = { 'italic' } },
            -- NvimTreeGitIgnored = { fg = colors.overlay0, style = { 'italic' } },
            -- NvimTreeGitStaged = { fg = colors.teal, style = { 'italic' } },
            -- NvimTreeGitDirty = { fg = colors.maroon, style = { 'italic' } },
            -- NvimTreeGitDeleted = { fg = colors.red, style = { 'italic' } },
            -- NvimTreeGitMerge = { fg = colors.peach, style = { 'italic' } },
            -- NvimTreeGitMerged = { fg = colors.pink, style = { 'italic' } },
            -- NvimTreeGitRenamed = { fg = colors.yellow, style = { 'italic' } },

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
            Visual = { bg = ucolors.darken('#9745be', 0.25, mocha.mantle), style = { 'italic' } },

            -- Vim Visual Multi
            VM_Mono = { bg = ucolors.darken('#f38ba8', 0.15, mocha.mantle), fg = colors.red, style = { 'bold' } },

            -- Noice CMDLine Popup
            -- NoiceCmdlinePopupBorder = { fg = colors.red },

            -- Gitsigns
            GitSignsStagedAdd = { fg = colors.blue },
        }
    end,
    highlight_overrides = {},
    color_overrides = {},
})

-- vim.cmd.colorscheme('catppuccin')
