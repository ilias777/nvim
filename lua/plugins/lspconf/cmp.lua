require('luasnip/loaders/from_lua').load({ paths = '~/.config/nvim/snippets/' })
require('luasnip/loaders/from_vscode').lazy_load()

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Kind icons
local kind_icons = {
    Class = ' ',
    Color = ' ',
    Constant = ' ',
    Constructor = ' ',
    Enum = '了 ',
    EnumMember = ' ',
    Event = '',
    Field = ' ',
    File = ' ',
    Folder = ' ',
    Function = 'ƒ ',
    Interface = 'ﰮ ',
    Keyword = ' ',
    Method = ' ',
    Module = ' ',
    Operator = ' ',
    Property = ' ',
    Reference = ' ',
    Snippet = '﬌ ',
    Struct = ' ',
    Text = ' ',
    Unit = ' ',
    Value = ' ',
    Variable = '𝝰 ',
    -- old
    -- Function = ' ',
    -- Method = 'ƒ ',
    -- Variable = ' ',
}

-- For luasnips integration
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local luasnip = require('luasnip')

-- Setup nvim-cmp
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- completion = {
        --     border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
        --     side_padding = 1,
        --     winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
        -- },
        -- completion = {
        --     winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
        --     col_offset = -3,
        --     side_padding = 0,
        -- },
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer', max_item_count = 10 },
        { name = 'nvim_lua', max_item_count = 10 },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'treesitter', max_item_count = 10 },
        -- { name = 'spell', option = {
        --     keep_all_entries = false,
        --     enable_in_context = function()
        --         return true
        --     end,
        --     max_item_count = 10,
        -- } },
    }),
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = function(entry, vim_item)
            -- Kind icons
            -- This concatonates the icons with the name of the item kind
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            -- vim_item.icons = string.format('%s', kind_icons[vim_item.kind])
            -- vim.item.kind = string.format('%s', kind_icons.kind)
            -- Source
            vim_item.menu = ({
                luasnip = '( LuaSnip )',
                buffer = '( Buffer )',
                nvim_lsp = '( LSP )',
                path = '( Path )',
                nvim_lsp_signature_help = '( Sign.Help )',
                nvim_lua = '( Lua )',
                treesitter = '( Treesitter )',
                -- spell = '( Spell )',
            })[entry.source.name]
            return vim_item
        end,
    },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})

-- Autopairs
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
