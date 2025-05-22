return {
    'mfussenegger/nvim-dap',
    cmd = { 'DapToggleBreakpoint' },
    keys = {
        { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = 'Add Breakpoint' },
    },
    dependencies = {
        'theHamsta/nvim-dap-virtual-text',
        opts = {
            commented = true,
            virt_text_pos = 'eol',
        },
    },
    config = function()
        require('plugins.dap.debug_adapter')
    end,
}
