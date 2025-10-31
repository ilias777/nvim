return {
    'greggh/claude-code.nvim',
    enabled = true,
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>aa', '<cmd>ClaudeCode<cr>', mode = { 'n', 'x' }, desc = 'Toggle Claude Code' },
        { '<leader>ac', '<cmd>ClaudeCodeContinue<cr>', desc = 'Claude Code Continue' },
        { '<leader>ar', '<cmd>ClaudeCodeResume<cr>', desc = 'Claude Code Resume' },
    },
    config = function()
        require('claude-code').setup({
            window = {
                split_ratio = 0.4,
                position = 'float',
                float = {
                    border = 'single',
                },
            },
        })
    end,
}
