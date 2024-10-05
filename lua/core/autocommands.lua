-- ╭─────────────────────────────────────────────────────────╮
-- │                 HIGHLIGHT SELECTET TEXT                 │
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
-- │                QUIT SOME WINDOWS WITH Q                 │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'help', 'qf', 'checkhealth', 'man', 'oil', 'aerial-nav', 'query' },
    callback = function()
        vim.keymap.set('n', 'q', '<cmd>bd<cr>', { silent = true, buffer = true })
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │                  QUIT DIFFVIEW WITH Q                   │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'DiffViewFiles' },
    callback = function()
        vim.keymap.set('n', 'q', '<cmd>tabc<cr>', { silent = true, buffer = true })
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
        vim.keymap.set('n', '<leader>ä', function()
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
            '<leader>öe',
            "<cmd>lua require('core.utils').set_ltex_lang('en')<cr>",
            { desc = 'Set english ltex-ls language' }
        )
        vim.api.nvim_set_keymap(
            'n',
            '<leader>ög',
            "<cmd>lua require('core.utils').set_ltex_lang('de')<cr>",
            { desc = 'Set german ltex-ls language' }
        )
        vim.api.nvim_set_keymap(
            'n',
            '<leader>ök',
            "<cmd>lua require('core.utils').set_ltex_lang('el')<cr>",
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
-- │        COMMENTS AND USERCOMMANDS FOR TYPST FILES        │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('Filetype', {
    pattern = 'typst',
    callback = function()
        -- Commentstring
        vim.bo.commentstring = '//%s'
        -- Pin main file user command
        vim.api.nvim_create_user_command('PinMain', function()
            vim.lsp.buf.execute_command({
                command = 'tinymist.pinMain',
                arguments = { vim.api.nvim_buf_get_name(0) },
            })
        end, {})
        -- Unpin main file user command
        vim.api.nvim_create_user_command('UnpinMain', function()
            vim.lsp.buf.execute_command({
                command = 'tinymist.pinMain',
                arguments = { nil },
            })
        end, {})
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │            DOCUMENT HIGHLIGHT ON CURSORHOLD             │
-- ╰─────────────────────────────────────────────────────────╯
-- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--     callback = function()
--         vim.lsp.buf.document_highlight()
--     end,
-- })
-- vim.api.nvim_create_autocmd('CursorMoved', {
--     callback = function()
--         vim.lsp.buf.clear_references()
--     end,
-- })

-- ╭─────────────────────────────────────────────────────────╮
-- │               MESSAGE IF MACRO IS STOPPED               │
-- ╰─────────────────────────────────────────────────────────╯
local macro_group = vim.api.nvim_create_augroup('MacroRecording', { clear = true })
vim.api.nvim_create_autocmd('RecordingLeave', {
    group = macro_group,
    callback = function()
        -- Display a message when macro recording stops
        print('Macro recording stopped')
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │                    VIM-VISUAL-MULTI                     │
-- ╰─────────────────────────────────────────────────────────╯
-- local visual_multi_group = vim.api.nvim_create_augroup('VisualMulti', { clear = true })
-- vim.api.nvim_create_autocmd('User', {
--     pattern = 'visual_multi_start',
--     callback = function()
--         -- vim.cmd('NoiceDisable')
--         vim.lsp.inlay_hint.enable(false)
--     end,
--     group = visual_multi_group,
-- })
-- vim.api.nvim_create_autocmd('User', {
--     pattern = 'visual_multi_exit',
--     callback = function()
--         -- vim.cmd('NoiceEnable')
--         vim.lsp.inlay_hint.enable(true)
--     end,
--     group = visual_multi_group,
-- })
