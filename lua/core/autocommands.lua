-- ╭─────────────────────────────────────────────────────────╮
-- │                 HIGHLIGHT SELECTES TEXT                 │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │                    CHANGE CURSORLINE                    │
-- ╰─────────────────────────────────────────────────────────╯
-- vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
--     callback = function()
--         vim.opt.cursorline = true
--     end,
-- })
--
-- vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
--     callback = function()
--         vim.opt.cursorline = false
--     end,
-- })

-- ╭─────────────────────────────────────────────────────────╮
-- │       DISABLE INLAY HINTS FOR SPECIFIC FILETYPES        │
-- ╰─────────────────────────────────────────────────────────╯
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = { 'zsh', 'conf' },
--     callback = function()
--         vim.lsp.inlay_hint.enable(0, false)
--     end,
-- })

-- ╭─────────────────────────────────────────────────────────╮
-- │    FORCE TREESITTER TO WORK WITH SPECIFIC FILESTYPES    │
-- ╰─────────────────────────────────────────────────────────╯
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = { 'zsh', 'conf' },
--     callback = function()
--         vim.bo.filetype = 'sh'
--     end,
-- })

-- ╭─────────────────────────────────────────────────────────╮
-- │    FORCE TREESITTER TO WORK WITH SPECIFIC FILESTYPES    │
-- ╰─────────────────────────────────────────────────────────╯
-- vim.filetype.add({
--     extension = {
--         sh = 'sh',
--         zsh = 'sh',
--         conf = 'sh',
--     },
--     filename = {
--         ['.zshrc'] = 'sh',
--         ['.zshenv'] = 'sh',
--         ['.conf'] = 'sh',
--     },
-- })

-- ╭─────────────────────────────────────────────────────────╮
-- │                   QUIT WINDOWS WITH Q                   │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'help', 'qf', 'checkhealth', 'man', 'oil', 'aerial-nav', 'query' },
    callback = function()
        vim.keymap.set('n', 'q', '<cmd>bd<cr>', { silent = true, buffer = true })
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │       CHECK IF CODE ACTIONS ARE AVAILEBLE ON LSP        │
-- ╰─────────────────────────────────────────────────────────╯
-- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--     callback = function()
--         require('code_action_utils').code_action_listener()
--     end,
-- })

-- ╭─────────────────────────────────────────────────────────╮
-- │                 OPEN HELP IN A NEW TAB                  │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'help',
    command = ':wincmd T',
})

-- ╭─────────────────────────────────────────────────────────╮
-- │             CHANGE LTEX LANGUAGE ON THE FLY             │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown', 'tex' },
    callback = function()
        vim.keymap.set('n', '<Space>ä', function()
            local options = {
                'English',
                'German',
                'Greek',
            }
            vim.ui.select(options, {
                prompt = 'Select language for ltex',
                -- format_item = function(item)
                --     return 'Set language to: ' .. item
                -- end,
            }, function(choice)
                if choice == 'English' then
                    vim.cmd('LtexLang en')
                elseif choice == 'German' then
                    vim.cmd('LtexLang de')
                elseif choice == 'Greek' then
                    vim.cmd('LtexLang el')
                end
            end)
        end, { desc = 'Change language for ltex' })
        vim.api.nvim_create_user_command(
            'LtexLang',
            "lua require('core.utils').set_ltex_lang(<q-args>)",
            { nargs = 1, desc = 'Set ltex-ls language' }
        )
        vim.api.nvim_set_keymap(
            'n',
            '<leader>le',
            "<cmd>lua require('core.utils').set_ltex_lang('en')<cr>",
            { desc = 'Set english ltex-ls language' }
        )
        vim.api.nvim_set_keymap(
            'n',
            '<leader>lg',
            "<cmd>lua require('core.utils').set_ltex_lang('en')<cr>",
            { desc = 'Set german ltex-ls language' }
        )
        vim.api.nvim_set_keymap(
            'n',
            '<leader>lk',
            "<cmd>lua require('core.utils').set_ltex_lang('en')<cr>",
            { desc = 'Set greek ltex-ls language' }
        )
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │                      FORMATOPTIONS                      │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    callback = function()
        vim.opt.formatoptions:remove({ 'o', 'r', 'c' })
        vim.opt.formatoptions:append({ 't' })
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │       JUMP TO LAST EDIT POSITION ON OPENING FILE        │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('BufReadPost', {
    desc = 'Open file at the last position it was edited earlier',
    pattern = '*',
    command = 'silent! normal! g`"zv',
})

-- ╭─────────────────────────────────────────────────────────╮
-- │               COMMENTS ON TYPST FILETYPE                │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('Filetype', {
    pattern = 'typst',
    callback = function()
        vim.bo.commentstring = '//%s'
    end,
})
