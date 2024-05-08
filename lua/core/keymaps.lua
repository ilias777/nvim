--  ╭──────────────────────────────────────────────────────────╮
--  │                      BASIC KEYMAPS                       │
--  ╰──────────────────────────────────────────────────────────╯

-- Function helpers
local Utils = require('core.utils')

-- Exit from insert mode
vim.keymap.set('i', 'kj', '<esc>')

-- Better up/down
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Search
vim.keymap.set('n', 'ƒ', '/')

-- Search for matches within visual selection
-- vim.keymap.set('x', '<space>/', '<Esc>/\\%V')

-- Search and replace word under the cursor
vim.keymap.set(
    'n',
    '<leader>/',
    ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
    { desc = 'Search and replace word under the cursor' }
)

-- Search and replace in visual selection
vim.keymap.set('x', '<leader>R', [[:s/\%V]], { desc = 'Search and replace in visual selection' })

-- For correcting a word in insert mode
vim.keymap.set('i', '<c-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

-- Buffers
vim.keymap.set('n', '<Space>bd', '<cmd>bd<cr>', { desc = 'Delete Buffer' })

-- Move to window (split) using <space> hlkj keys
vim.keymap.set('n', '<Space>h', '<c-w>h', { desc = 'Split Left' })
vim.keymap.set('n', '<Space>l', '<c-w>l', { desc = 'Split Right' })
vim.keymap.set('n', '<Space>k', '<c-w>k', { desc = 'Split Up' })
vim.keymap.set('n', '<Space>j', '<c-w>j', { desc = 'Split Down' })
vim.keymap.set('n', '<Space>m', function()
    Utils.max_or_equal()
end, { desc = 'Max or Equal Split' })

-- Resize split panes
vim.keymap.set('n', '<M-UP>', '<cmd>resize +2<cr>')
vim.keymap.set('n', '<M-DOWN>', '<cmd>resize -2<cr>')
vim.keymap.set('n', '<M-LEFT>', '<cmd>vertical resize +2<cr>')
vim.keymap.set('n', '<M-RIGHT>', '<cmd>vertical resize -2<cr>')

-- Move lines
vim.keymap.set('n', '<c-k>', ':m -2<CR>==', { silent = true })
vim.keymap.set('n', '<c-j>', ':m +1<CR>==', { silent = true })
-- vim.keymap.set('i', '<c-k>', '<esc><cmd>m .-2<cr>==gi')
-- vim.keymap.set('i', '<c-j>', '<esc><cmd>m .+1<cr>==gi')
vim.keymap.set('v', '<c-k>', ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set('v', '<c-j>', ":m '>+1<CR>gv=gv", { silent = true })

-- Indent lines in visual selection
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('n', '<', '<<')
vim.keymap.set('n', '>', '>>')

-- Paste
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('x', 'p', 'P')
vim.keymap.set('n', 'dD', '"_dd')

-- Not yanking with 'c' and 'x'
vim.keymap.set({ 'n', 'v' }, 'c', '"_c')
vim.keymap.set('n', 'C', '"_C')
-- vim.keymap.set('n', 'x', '"_x')

-- Jump to BoL and EoL without living instert mode
vim.keymap.set('i', '<M-i>', '<Esc>I', { desc = 'Jump to Beginn of Line in insert mode' })
vim.keymap.set('i', '<M-a>', '<Esc>A', { desc = 'Jump to End of Line in insert mode' })

-- Inner quotes
vim.keymap.set({ 'o', 'x' }, 'iq', "i'", { desc = 'Inner Single Quotes' })
vim.keymap.set({ 'o', 'x' }, 'iQ', 'i"', { desc = 'Inner Double Quotes' })

-- Outer quotes
vim.keymap.set({ 'o', 'x' }, 'aq', "2i'", { desc = 'Around Single Quotes' })
vim.keymap.set({ 'o', 'x' }, 'aQ', '2i"', { desc = 'Around Double Quotes' })
vim.keymap.set({ 'o', 'x' }, "a'", "2i'", { desc = 'Around Single Quotes' })
vim.keymap.set({ 'o', 'x' }, 'a"', '2i"', { desc = 'Around Double Quotes' })

-- Inner and outer rectangle brackets []
vim.keymap.set({ 'o', 'x' }, 'ir', 'i[')
vim.keymap.set({ 'o', 'x' }, 'ar', 'a[')

-- Add blank line without leaving normal mode
vim.keymap.set('n', '<leader>o', 'o<Esc>')
vim.keymap.set('n', '<leader>O', 'O<Esc>')

-- Add komma
-- vim.keymap.set("n", ",,", [[f'a]])
vim.keymap.set('i', '<C-,>', '<esc>la,', { silent = true })
vim.keymap.set('i', '<C-b>', '<esc>la,<esc>hi', { silent = true })

-- Go to last change
vim.keymap.set('n', 'g,', 'g;', { desc = 'Go to newest change' })
vim.keymap.set('n', 'g;', 'g,', { desc = 'Go to last change' })

-- Clear search with <esc>
vim.keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- Add new file
vim.keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- Indent properly when entering insert mode on empty lines
vim.keymap.set('n', 'i', function()
    if vim.api.nvim_get_current_line():find('^%s*$') then
        return [["_cc]]
    end
    return 'i'
end, { expr = true, desc = 'better i' })

-- Spelling
vim.keymap.set('n', 'z.', '1z=', { desc = '󰓆 Fix Spelling' })

--  ╭──────────────────────────────────────────────────────────╮
--  │                 PLUGINS RELATED KEYMAPS                  │
--  ╰──────────────────────────────────────────────────────────╯

-- Bufferline.nvim
vim.keymap.set('n', '<S-Left>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Buffer Previous' })
vim.keymap.set('n', '<S-Right>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Buffer Next' })
vim.keymap.set('n', '<space>bp', '<cmd>BufferLineTogglePin<cr>', { desc = 'Pin Buffer' })
vim.keymap.set('n', '<space>bk', '<cmd>BufferLinePick<cr>', { desc = 'Pick Buffer' })
vim.keymap.set('n', '<space>bo', '<cmd>BufferLineCloseOthers<cr>', { desc = 'Close Other Buffers' })
vim.keymap.set('n', '<space>b<left>', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move Buffer to the left' })
vim.keymap.set('n', '<space>b<right>', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move Buffer to the right' })
vim.keymap.set('n', '<space>b1', '<cmd>BufferLineGoToBuffer 1<cr>', { desc = 'Go to Buffer 1' })
vim.keymap.set('n', '<space>b2', '<cmd>BufferLineGoToBuffer 2<cr>', { desc = 'Go to Buffer 2' })
vim.keymap.set('n', '<space>b3', '<cmd>BufferLineGoToBuffer 3<cr>', { desc = 'Go to Buffer 3' })
vim.keymap.set('n', '<space>b4', '<cmd>BufferLineGoToBuffer 4<cr>', { desc = 'Go to Buffer 4' })
vim.keymap.set('n', '<space>b5', '<cmd>BufferLineGoToBuffer 5<cr>', { desc = 'Go to Buffer 5' })
vim.keymap.set('n', '<space>b6', '<cmd>BufferLineGoToBuffer 6<cr>', { desc = 'Go to Buffer 6' })
vim.keymap.set('n', '<space>b7', '<cmd>BufferLineGoToBuffer 7<cr>', { desc = 'Go to Buffer 7' })
vim.keymap.set('n', '<space>b8', '<cmd>BufferLineGoToBuffer 8<cr>', { desc = 'Go to Buffer 8' })
vim.keymap.set('n', '<space>b9', '<cmd>BufferLineGoToBuffer 9<cr>', { desc = 'Go to Buffer 9' })

-- nvim-treehopper (vm<motion> or ym<motion>)
vim.keymap.set('o', 'm', [[:<c-u>lua require 'tsht'.nodes()<cr>]], { silent = true, remap = true })
vim.keymap.set('x', 'm', [[:<c-u>lua require 'tsht'.nodes()<cr>]], { silent = true })

-- lazy.nvim
vim.keymap.set('n', '<Leader>la', '<cmd>Lazy<cr>', { desc = 'Open Lazy' })
vim.keymap.set('n', '<Leader>lc', '<cmd>Lazy check<cr>', { desc = 'Check Lazy Plugins' })
vim.keymap.set('n', '<Leader>ls', '<cmd>Lazy sync<cr>', { desc = 'Sync Lazy Plugins' })

-- nvim-dap
vim.keymap.set(
    'n',
    '<leader>dB',
    '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
    { desc = 'Add Conditional Breakpoint' }
)
vim.keymap.set('n', '<leader>dc', '<cmd>DapContinue<CR>', { desc = 'Dap Continue' })
vim.keymap.set('n', '<leader>dsi', '<cmd>DapStepInto<CR>', { desc = 'Dap Step Into' })
vim.keymap.set('n', '<leader>dso', '<cmd>DapStepOver<CR>', { desc = 'Dap Step Over' })
vim.keymap.set('n', '<leader>dst', '<cmd>DapStepOut<CR>', { desc = 'Dap Step Out' })
vim.keymap.set('n', '<leader>dt', '<cmd>DapTerminate<CR>', { desc = 'Dap Terminate' })
vim.keymap.set('n', '<leader>dl', '<cmd>DapShowLog<CR>', { desc = 'Dap Show Log' })
vim.keymap.set('n', '<leader>dr', '<cmd>DapToggleRepl<CR>', { desc = 'Dap Toggle Repl' })

-- diffview.nvim
vim.keymap.set('n', '<leader>dv', function()
    local lib = require('diffview.lib')
    local view = lib.get_current_view()
    if view then
        -- Current tabpage is a Diffview; close it
        vim.cmd.DiffviewClose()
    else
        -- No open Diffview exists: open a new one
        vim.cmd.DiffviewOpen()
    end
end, { desc = 'Diffview Toggle' })

-- hop.nvim
vim.keymap.set('n', '<leader>hl', '<cmd>HopLine<cr>', { desc = 'Hop Line' })
vim.keymap.set('n', '<leader>h1', '<cmd>HopChar1<cr>', { desc = 'Hop 1 Char' })
vim.keymap.set('n', '<leader>h2', '<cmd>HopChar2<cr>', { desc = 'Hop 2 Chars' })
vim.keymap.set('n', '<leader>hc', '<cmd>HopVertical<cr>', { desc = 'Hop Vertical' })

-- noice.nvim
vim.keymap.set('n', '<space>nn', '<cmd>Noice<cr>', { desc = 'Noice Messages' })
vim.keymap.set('n', '<space>nl', '<cmd>NoiceLast<cr>', { desc = 'Noice Last' })
vim.keymap.set('n', '<space>nt', '<cmd>NoiceTelescope<cr>', { desc = 'Noice Telescope' })

-- toggleterm.nvim
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'kj', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- vim-visual-multi
vim.keymap.set('n', 'cp', 'vip<Plug>(VM-Visual-Cursors)')
vim.keymap.set('x', '<M-c>', '<Plug>(VM-Visual-Cursors)')
vim.keymap.set('x', '<M-s>', ':VMSearch ')
vim.keymap.set('n', '<M-s>', ':%VMSearch ')

--  ╭──────────────────────────────────────────────────────────╮
--  │                    FOR GREEK KEYBOARD                    │
--  ╰──────────────────────────────────────────────────────────╯
vim.keymap.set('i', '<C-ε>', '<C-e>', { remap = true })
