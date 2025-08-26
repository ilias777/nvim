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
    pattern = { 'help', 'qf', 'man', 'oil', 'aerial-nav', 'query', 'checkhealth' },
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
-- │                 OPEN HELP IN A NEW TAB                  │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'help',
    command = ':wincmd T',
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

-- ╭─────────────────────────────────────────────────────────╮
-- │                    GITCOMMIT MESSAGE                    │
-- ╰─────────────────────────────────────────────────────────╯
local commit = vim.api.nvim_create_augroup('CommitMessage', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'gitcommit',
    group = commit,
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 72
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │           CLOSE QUICKFIX WINDOW AFTER SELECT            │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'qf',
    callback = function()
        vim.keymap.set('n', '<CR>', '<CR>:cclose<CR>', { buffer = true, silent = true })
    end,
})
