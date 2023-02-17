local ucolors = require('catppuccin.utils.colors')
local macchiato = require('catppuccin.palettes').get_palette('macchiato')

vim.g.catppuccin_flavour = 'macchiato'

local catppuccin = require('catppuccin')

catppuccin.setup({
    flavour = 'mocha', -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = 'latte',
        dark = 'macchiato',
    },
    compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = 'dark',
        percentage = 0.15,
    },
    styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = { 'italic' },
        strings = {},
        variables = { 'italic' },
        numbers = {},
        booleans = { 'italic' },
        properties = { 'italic' },
        types = {},
        operators = {},
    },
    -- Integrations
    integrations = {
        beacon = true,
        cmp = true,
        fidget = true,
        gitsigns = true,
        hop = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        neogit = true,
        noice = true,
        notify = true,
        nvimtree = true,
        pounce = true,
        symbols_outline = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        ts_rainbow2 = true,
        which_key = false,
        dap = {
            enabled = true,
            enable_ui = true,
        },
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { 'italic' },
                hints = { 'italic' },
                warnings = { 'italic' },
                information = { 'italic' },
            },
            underlines = {
                errors = { 'undercurl' },
                hints = { 'undercurl' },
                warnings = { 'undercurl' },
                information = { 'undercurl' },
            },
        },
        navic = {
            enable = true,
            custom_bg = 'NONE',
        },
    },
    custom_highlights = function(colors)
        return {
            -- Variable
            -- ['@field.lua'] = { fg = colors.teal },

            -- Float Border
            -- NormalFloat = { bg = colors.crust },

            -- Cmp Menu
            -- Pmenu = { bg = colors.mantle },
            -- PmenuSel = { fg = colors.mantle, bg = colors.maroon, style = { 'bold' } },
            Pmenu = { bg = colors.base },
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

            -- Beacon
            Beacon = { bg = colors.teal },

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
            MatchParen = { style = { 'underline' } },
            -- MatchParen = { fg = colors.base, bg = colors.red },

            -- Visual Mode
            Visual = { bg = ucolors.darken('#9745be', 0.25, macchiato.mantle), style = { 'italic' } },
        }
    end,
    highlight_overrides = {},
    color_overrides = {},
})
