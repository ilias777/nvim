return {
    'shellRaining/hlchunk.nvim',
    enabled = true,
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
