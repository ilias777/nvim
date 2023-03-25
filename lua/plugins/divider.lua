return {
    'https://github.com/niuiic/divider.nvim',
    enabled = false,
    event = 'BufReadPre',
    config = function()
        require('divider').setup({
            dividers = {
                {
                    -- === Test ===
                    -- divider_pattern is passed to rg command
                    -- divider_pattern = [[%%=+ [\s\S]+ =+%%]],
                    divider_pattern = [[=== [\s\S]+ ===]],
                    -- content_pattern is used by lua function string.match
                    content_pattern = [[%%%%=+ ([%s%S]*) =+%%%%]],
                    -- highlight color
                    hl = '#ff00ff',
                    -- list = true means this divider will be listed in loclist
                    list = true,
                },
                {
                    divider_pattern = [[%%-+ [\s\S]+ -+%%]],
                    content_pattern = [[%%%%%-+ ([%s%S]*) %-+%%%%]],
                    hl = '#ffff00',
                    list = true,
                },
                {
                    divider_pattern = [[%% [\s\S]+ %%]],
                    content_pattern = [[%%%% ([%s%S]*) %%%%]],
                    hl = '#00ff7c',
                    list = false,
                },
            },
        })
    end,
}
