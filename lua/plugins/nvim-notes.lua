return {
    'adibhanna/nvim-notes',
    dependencies = { 'MunifTanjim/nui.nvim' },
    keys = {
        { '<leader><tab>n', desc = 'Create new note' },
        { '<leader><tab>s', desc = 'Search note' },
        { '<leader><tab>t', desc = 'Search by tags' },
        { '<leader><tab>p', desc = 'Toggle pin current note' },
        { '<leader><tab>d', desc = 'Delete current note' },
        { '<leader><tab>v', desc = 'Preview current note' },
        { '<leader><tab>i', desc = 'Show notes dashboard popup' },
        { '<leader><tab>S', desc = 'Sync notes with GitHub' },
    },
    opts = {
        vault_path = '~/Notes',
        template = [[
---
**Created:** {{date}} at {{time}}
**Tags:** 
---

# {{title}}
]],
    },
}
