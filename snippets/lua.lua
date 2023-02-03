local ls = require('luasnip')
local s = ls.s -- Snippet
local i = ls.i -- Insert node
local t = ls.t -- Text node

local d = ls.dynamic_node -- Dynamic node
local c = ls.choice_node -- Choice node
local f = ls.function_node -- Function node
local sn = ls.snippet_node -- Snippet node

local fmt = require('luasnip.extras.fmt').fmt -- Format
local rep = require('luasnip.extras').rep -- Repeat

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup('Lua Snippets', { clear = true })
local file_pattern = '*.lua'

local function cs(trigger, nodes, opts)
    local snippet = s(trigger, nodes)
    local target_table = snippets

    local pattern = file_pattern
    local keymaps = {}

    if opts ~= nil then
        -- check for custom pattern
        if opts.pattern then
            pattern = opts.pattern
        end

        -- if opts is a string
        if type(opts) == 'string' then
            if opts == 'auto' then
                target_table = autosnippets
            else
                table.insert(keymaps, { 'i', opts })
            end
        end

        -- if opts is a table
        if opts ~= nil and type(opts) == 'table' then
            for _, keymap in ipairs(opts) do
                if type(keymap) == 'string' then
                    table.insert(keymaps, { 'i', keymap })
                else
                    table.insert(keymaps, keymap)
                end
            end
        end

        -- set autocmd for each keymap
        if opts ~= 'auto' then
            for _, keymap in ipairs(keymaps) do
                vim.api.nvim_create_autocmd('BufEnter', {
                    pattern = pattern,
                    group = group,
                    callback = function()
                        vim.keymap.set(keymap[1], keymap[2], function()
                            ls.snip_expand(snippet)
                        end, { noremap = true, silent = true, buffer = true })
                    end,
                })
            end
        end
    end

    table.insert(target_table, snippet) -- insert snippet into appropriate table
end

-- Start Refactoring --

local mySnip = s(
    'mySnip',
    fmt(
        [[
local {} = function({})
    {}
end
]],
        {
            i(1, 'myVar'),
            c(2, { t(''), t('myArg') }),
            i(3, '-- TODO: '),
        }
    )
)

local config_functionSnip = s(
    'conffn',
    fmt(
        [[
config = function()
    {}
end
]],
        {
            i(1),
        }
    )
)

table.insert(snippets, mySnip)
table.insert(snippets, config_functionSnip)

-- End Refactoring --

return snippets, autosnippets
