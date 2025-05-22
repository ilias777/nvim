return {
    'brenoprata10/nvim-highlight-colors',
    enabled = true,
    event = 'BufReadPre',
    opts = {
        render = 'virtual', ---@usage 'background'|'foreground'|'virtual'
        virtual_symbol = '',
    },
    config = true,
}
