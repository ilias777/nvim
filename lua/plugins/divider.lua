return {
    'https://github.com/niuiic/divider.nvim',
    enabled = true,
    event = 'BufReadPre',
    dependencies = {
        'niuiic/niuiic-core.nvim',
    },
    config = function()
        require('divider').setup({
            dividers = {
                {
                    -- === test2 ===
                    -- ==- test3 -==
                    -- %%= hallo =%%
                    -- %% test %%
                    -- %%%%= hiii =%%%%
                    -- %%- hi -%%
                    -- %%%%%- hi %-%%%%
                    -- regex used to match dividers
                    -- this is passed to rg command
                    divider_regex = [[%%=+ [\s\S]+ =+%%]],
                    -- regex used to match content of each divider
                    -- this is used by lua function string.match
                    content_regex = [[%%%%=+ ([%s%S]*) =+%%%%]],
                    -- highlight color
                    hl = '#ff00ff',
                    -- icon (string | nil)
                    icon = '',
                    -- icon color (string | nil)
                    icon_hl = '#ffff00',
                    -- whether to show in list (boolean | nil)
                    hide = false,
                },
                {
                    divider_regex = [[%%-+ [\s\S]+ -+%%]],
                    content_regex = [[%%%%%-+ ([%s%S]*) %-+%%%%]],
                    hl = '#ffff00',
                    icon = '',
                },
                {
                    divider_regex = [[%% [\s\S]+ %%]],
                    content_regex = [[%%%% ([%s%S]*) %%%%]],
                    hl = '#00ff7c',
                    icon = '',
                },
                {
                    divider_regex = [[===+ [\s\S]+ =+==]],
                    content_regex = [[==- ([%s%S]*) -==]],
                    hl = '#ff00ff',
                    icon = '',
                },
            },
            enabled_filetypes = { 'lua' },
            ui = {
                -- "v" | "h"
                direction = 'v',
                size = 40,
                enter = true,
            },
        })
    end,
}
