return {
    'windwp/nvim-autopairs',
    enabled = true,
    event = 'InsertEnter',
    config = function()
        require('nvim-autopairs').setup({
            fast_wrap = {},
        })

        local npairs = require('nvim-autopairs')
        local Rule = require('nvim-autopairs.rule')
        local cond = require('nvim-autopairs.conds')

        local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }

        -- ADD SPACES BETWEEN PARENTHESES
        npairs.add_rules({
            -- Rule for a pair with left-side ' ' and right side ' '
            Rule(' ', ' ')
                -- Pair will only occur if the conditional function returns true
                :with_pair(
                    function(opts)
                        -- We are checking if we are inserting a space in (), [], or {}
                        local pair = opts.line:sub(opts.col - 1, opts.col)
                        return vim.tbl_contains({
                            brackets[1][1] .. brackets[1][2],
                            brackets[2][1] .. brackets[2][2],
                            brackets[3][1] .. brackets[3][2],
                        }, pair)
                    end
                )
                :with_move(cond.none())
                :with_cr(cond.none())
                -- We only want to delete the pair of spaces when the cursor is as such: ( | )
                :with_del(
                    function(opts)
                        local col = vim.api.nvim_win_get_cursor(0)[2]
                        local context = opts.line:sub(col - 1, col + 2)
                        return vim.tbl_contains({
                            brackets[1][1] .. '  ' .. brackets[1][2],
                            brackets[2][1] .. '  ' .. brackets[2][2],
                            brackets[3][1] .. '  ' .. brackets[3][2],
                        }, context)
                    end
                ),
        })

        -- ARROW KEY ON JAVASCRIPT
        npairs.add_rules({
            Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript' })
                :use_regex(true)
                :set_end_pair_length(2),
        })

        -- AUTO ADDSPACE ON =
        npairs.add_rules({
            Rule('=', '')
                :with_pair(cond.not_inside_quote())
                :with_pair(function(opts)
                    local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
                    if last_char:match('[%w%=%s]') then
                        return true
                    end
                    return false
                end)
                :replace_endpair(function(opts)
                    local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
                    local next_char = opts.line:sub(opts.col, opts.col)
                    next_char = next_char == ' ' and '' or ' '
                    if prev_2char:match('%w$') then
                        return '<bs> =' .. next_char
                    end
                    if prev_2char:match('%=$') then
                        return next_char
                    end
                    if prev_2char:match('=') then
                        return '<bs><bs>=' .. next_char
                    end
                    return ''
                end)
                :set_end_pair_length(0)
                :with_move(cond.none())
                :with_del(cond.none()),
        })

        -- For each pair of brackets we will add another rule
        for _, bracket in pairs(brackets) do
            npairs.add_rules({
                -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
                Rule(bracket[1] .. ' ', ' ' .. bracket[2])
                    :with_pair(cond.none())
                    :with_move(function(opts)
                        return opts.char == bracket[2]
                    end)
                    :with_del(cond.none())
                    :use_key(bracket[2])
                    -- Removes the trailing whitespace that can occur without this
                    :replace_map_cr(
                        function(_)
                            return '<C-c>2xi<CR><C-c>O'
                        end
                    ),
            })
        end

        -- MOVE PAST COMMAS AND SEMICOLONS
        for _, punct in pairs({ ',', ';' }) do
            require('nvim-autopairs').add_rules({
                require('nvim-autopairs.rule')('', punct)
                    :with_move(function(opts)
                        return opts.char == punct
                    end)
                    :with_pair(function()
                        return false
                    end)
                    :with_del(function()
                        return false
                    end)
                    :with_cr(function()
                        return false
                    end)
                    :use_key(punct),
            })
        end
    end,
}
