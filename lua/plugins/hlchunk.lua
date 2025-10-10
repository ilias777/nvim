return {
    'shellRaining/hlchunk.nvim',
    enabled = false,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('hlchunk').setup({
            chunk = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
    end,
}
