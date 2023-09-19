return {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
        require('nvim-autopairs').setup({
            fast_wrap = {},
        })

        local npairs = require('nvim-autopairs')
        local Rule = require('nvim-autopairs.rule')

        -- local opt = require('nvim-autopairs').config
        -- local basic = require('nvim-autopairs.rules.basic')
        local utils = require('nvim-autopairs.utils')
        local original_is_close_bracket = utils.is_close_bracket
        function utils.is_close_bracket(char)
            return original_is_close_bracket(char) or char == '>'
        end

        -- local bracket = basic.bracket_creator(opt)

        npairs.add_rules({
            Rule(' ', ' '):with_pair(function(opts)
                local pair = opts.line:sub(opts.col - 1, opts.col)
                return vim.tbl_contains({ '()', '[]', '{}' }, pair)
            end),
            Rule('( ', ' )')
                :with_pair(function()
                    return false
                end)
                :with_move(function(opts)
                    return opts.prev_char:match('.%)') ~= nil
                end)
                :use_key(')'),
            Rule('{ ', ' }')
                :with_pair(function()
                    return false
                end)
                :with_move(function(opts)
                    return opts.prev_char:match('.%}') ~= nil
                end)
                :use_key('}'),
            Rule('[ ', ' ]')
                :with_pair(function()
                    return false
                end)
                :with_move(function(opts)
                    return opts.prev_char:match('.%]') ~= nil
                end)
                :use_key(']'),
            Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript' }):use_regex(true):set_end_pair_length(2),
            -- bracket('<', '>'),
        })
    end,
}
