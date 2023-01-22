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

local group = vim.api.nvim_create_augroup('JavaScript Snippets', { clear = true })
local file_pattern = '*.js'

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

local forin = s(
    'forin',
    fmt(
        [[
for (const {} in {}) {{
    {}
}}
]],
        {
            i(1, 'iterator'),
            i(2, 'array'),
            i(3),
        }
    )
)

table.insert(snippets, forin)

-- End Refactoring --

return snippets, autosnippets
