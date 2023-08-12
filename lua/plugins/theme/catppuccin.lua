local ucolors = require('catppuccin.utils.colors')
local mocha = require('catppuccin.palettes').get_palette('mocha')

-- vim.g.catppuccin_flavour = 'mocha'

local catppuccin = require('catppuccin')

catppuccin.setup({
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
        neogit = true,
        noice = true,
        notify = true,
        symbols_outline = true,
        treesitter_context = true,
        native_lsp = {
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
        flash = true,
    },
    custom_highlights = function(colors)
        return {
            -- Identifier (like keyword require)
            ['@function.builtin'] = { fg = colors.flamingo },

            -- Cmp Menu
            -- Pmenu = { bg = colors.mantle },
            -- PmenuSel = { fg = colors.mantle, bg = colors.maroon, style = { 'bold' } },
            -- Pmenu = { bg = colors.base },
            PmenuSel = { fg = colors.base, bg = colors.maroon, style = { 'bold' } },

            -- Cmp Item Kind
            -- CmpItemKindSnippet = { fg = colors.base, bg = colors.mauve },
            -- CmpItemKindKeyword = { fg = colors.base, bg = colors.red },
            -- CmpItemKindText = { fg = colors.base, bg = colors.teal },
            -- CmpItemKindMethod = { fg = colors.base, bg = colors.blue },
            -- CmpItemKindConstructor = { fg = colors.base, bg = colors.blue },
            -- CmpItemKindFunction = { fg = colors.base, bg = colors.blue },
            -- CmpItemKindFolder = { fg = colors.base, bg = colors.blue },
            -- CmpItemKindModule = { fg = colors.base, bg = colors.blue },
            -- CmpItemKindConstant = { fg = colors.base, bg = colors.peach },
            -- CmpItemKindField = { fg = colors.base, bg = colors.green },
            -- CmpItemKindProperty = { fg = colors.base, bg = colors.green },
            -- CmpItemKindEnum = { fg = colors.base, bg = colors.green },
            -- CmpItemKindUnit = { fg = colors.base, bg = colors.green },
            -- CmpItemKindClass = { fg = colors.base, bg = colors.yellow },
            -- CmpItemKindVariable = { fg = colors.base, bg = colors.flamingo },
            -- CmpItemKindFile = { fg = colors.base, bg = colors.blue },
            -- CmpItemKindInterface = { fg = colors.base, bg = colors.yellow },
            -- CmpItemKindColor = { fg = colors.base, bg = colors.red },
            -- CmpItemKindReference = { fg = colors.base, bg = colors.red },
            -- CmpItemKindEnumMember = { fg = colors.base, bg = colors.red },
            -- CmpItemKindStruct = { fg = colors.base, bg = colors.blue },
            -- CmpItemKindValue = { fg = colors.base, bg = colors.peach },
            -- CmpItemKindEvent = { fg = colors.base, bg = colors.blue },
            -- CmpItemKindOperator = { fg = colors.base, bg = colors.blue },
            -- CmpItemKindTypeParameter = { fg = colors.base, bg = colors.blue },
            -- CmpItemKindCopilot = { fg = colors.base, bg = colors.teal },

            -- Telescope
            TelescopeBorder = { fg = colors.blue },
            TelescopeSelectionCaret = { fg = colors.flamingo },
            TelescopeSelection = { fg = colors.text, bg = colors.surface0, style = { 'bold' } },
            TelescopeMatching = { fg = colors.blue },
            TelescopePromptPrefix = { fg = colors.yellow, bg = colors.crust },
            TelescopePromptNormal = { bg = colors.crust },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopePreviewNormal = { bg = colors.crust },
            TelescopePromptBorder = { bg = colors.crust, fg = colors.crust },
            TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
            TelescopePromptTitle = { fg = colors.crust, bg = colors.mauve },
            TelescopeResultsTitle = { fg = colors.crust, bg = colors.mauve },
            TelescopePreviewTitle = { fg = colors.crust, bg = colors.mauve },

            -- Bufferline
            BufferLineIndicatorSelected = { fg = colors.pink },
            BufferLineIndicator = { fg = colors.base },
            BufferLineModifiedSelected = { fg = colors.teal },
            TabLineSel = { bg = colors.pink },

            -- Cursorline & Linenumbers
            CursorLine = { bg = colors.mantle },

            -- Folds
            -- Folded = { bg = colors.base },

            -- Match Parenthesis
            -- MatchParen = { style = { 'underline' } },
            MatchParen = { bg = colors.none },
            -- MatchParen = { fg = colors.base, bg = colors.red },
            -- MatchParen = { fg = colors.base, bg = ucolors.darken(colors.red, 0.65, mocha.rosewater) },

            -- Inlay hints
            -- LspInlayHint = { bg = colors.mantle },

            -- Neotree
            NeoTreeGitAdded = { fg = colors.green, style = { 'italic' } },
            NeoTreeGitConflict = { fg = colors.red, style = { 'italic' } },
            NeoTreeGitDeleted = { fg = colors.red, style = { 'italic' } },
            NeoTreeGitIgnored = { fg = colors.overlay0, style = { 'italic' } },
            NeoTreeGitModified = { fg = colors.yellow, style = { 'italic' } },
            NeoTreeGitUnstaged = { fg = colors.red, style = { 'italic' } },
            NeoTreeGitUntracked = { fg = colors.blue, style = { 'italic' } },
            NeoTreeGitStaged = { fg = colors.green, style = { 'italic' } },

            -- Visual Mode
            Visual = { bg = ucolors.darken('#9745be', 0.25, mocha.mantle), style = { 'italic' } },
        }
    end,
    highlight_overrides = {},
    color_overrides = {},
})

-- vim.cmd.colorscheme('catppuccin')
