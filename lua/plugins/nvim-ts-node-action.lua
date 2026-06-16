return {
    'ckolkey/ts-node-action',
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
        { '+', '<cmd>NodeAction<cr>', desc = 'Trigger Node Action' },
    },
    opts = {},
}
