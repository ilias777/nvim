return {
    'nvim-zh/colorful-winsep.nvim',
    enabled = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        indicator_for_2wins = {
            position = 'center', -- false | "center" | "start" | "end" | "both"
        },
    },
}
