return {
    'ckolkey/ts-node-action',
    keys = {
        { 'Ü', '<cmd>NodeAction<cr>', desc = 'Trigger Node Action' },
    },
    dependencies = { 'nvim-treesitter' },
    config = function()
        require('ts-node-action').setup()
    end,
}
