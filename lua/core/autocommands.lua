-- Highlight selectes text
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})

-- Cursorline on normal mode and no cursorline on insert mode
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

-- Disable inlay hints for specific filetypes
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'zsh', 'conf' },
    callback = function()
        vim.lsp.inlay_hint(0, false)
    end,
})

-- Force treesitter to work with specific filestypes
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = { 'zsh', 'conf' },
--     callback = function()
--         vim.bo.filetype = 'sh'
--     end,
-- })

-- Force treesitter to work with specific filestypes
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

-- Quit some windows with q
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'help', 'qf', 'checkhealth', 'man', 'oil' },
    callback = function()
        vim.keymap.set('n', 'q', '<cmd>bd<cr>', { silent = true, buffer = true })
    end,
})

-- Check if code actions are availeble on lsp
-- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--     callback = function()
--         require('code_action_utils').code_action_listener()
--     end,
-- })

-- Open help in a new tab
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'help',
    command = ':wincmd T',
})

-- Keymap to change ltex language on markdown and tex files
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
    end,
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    callback = function()
        vim.opt.formatoptions:remove({ 'o', 'r' })
        vim.opt.formatoptions:append({ 't' })
    end,
})
