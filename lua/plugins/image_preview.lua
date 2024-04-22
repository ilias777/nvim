return {
    'adelarsq/image_preview.nvim',
    enabled = true,
    keys = { '<leader>p' },
    config = function()
        require('image_preview').setup()
    end,
}
