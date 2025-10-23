return {
    'greggh/claude-code.nvim',
    enabled = true,
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>a', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude Code' },
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
