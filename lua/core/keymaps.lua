--  ╭──────────────────────────────────────────────────────────╮
--  │                      BASIC KEYMAPS                       │
--  ╰──────────────────────────────────────────────────────────╯
-- Exit from insert mode
vim.keymap.set('i', 'kj', '<esc>')

-- Search
vim.keymap.set('n', '<Leader>s', '/')
vim.keymap.set('n', '<Leader>S', '?')

-- Search for matches within visual selection
-- vim.keymap.set('x', '<space>/', '<Esc>/\\%V')

-- Search and replace word under the cursor
vim.keymap.set('n', '<leader>r', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Search and replace in visual selection
vim.keymap.set('x', '<leader>/', [[:s/\%V]])

-- For correcting a word in insert mode
vim.keymap.set('i', '<c-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

-- Buffers
vim.keymap.set('n', '<Space>bd', '<cmd>bd<cr>', { desc = 'Delete Buffer' })

-- Swich split panes
-- vim.keymap.set('n', '<Space>h', '<c-w>h', { desc = 'Split Left' })
-- vim.keymap.set('n', '<Space>l', '<c-w>l', { desc = 'Split Right' })
-- vim.keymap.set('n', '<Space>k', '<c-w>k', { desc = 'Split Up' })
-- vim.keymap.set('n', '<Space>j', '<c-w>j', { desc = 'Split Down' })

-- Resize split panes
vim.keymap.set('n', '<M-UP>', '<cmd>resize +2<cr>')
vim.keymap.set('n', '<M-DOWN>', '<cmd>resize -2<cr>')
vim.keymap.set('n', '<M-LEFT>', '<cmd>vertical resize +2<cr>')
vim.keymap.set('n', '<M-RIGHT>', '<cmd>vertical resize -2<cr>')

-- Move lines
vim.keymap.set('n', '<c-k>', ':m -2<CR>==')
vim.keymap.set('n', '<c-j>', ':m +1<CR>==')
vim.keymap.set('v', '<c-K>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<c-J>', ":m '>+1<CR>gv=gv")

-- Indent lines in visual selection
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Paste
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('n', 'dD', '"_dd')

-- Not yanking with 'c' and 'x'
vim.keymap.set('n', 'ciw', '"_ciw')
vim.keymap.set('n', 'C', '"_C')
-- vim.keymap.set('n', 'x', '"_x')

-- Add blank line without leaving normal mode
vim.keymap.set('n', '<leader>o', 'o<Esc>')
vim.keymap.set('n', '<leader>O', 'O<Esc>')

-- Delete word with backspace
vim.keymap.set('n', '<BS>', 'ge')
vim.keymap.set('n', '<C-BS>', 'a<C-w>')

--  ╭──────────────────────────────────────────────────────────╮
--  │                 PLUGINS RELATED KEYMAPS                  │
--  ╰──────────────────────────────────────────────────────────╯

-- Bufferline.nvim
vim.keymap.set('n', '<S-Left>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Buffer Previous' })
vim.keymap.set('n', '<S-Right>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Buffer Next' })

-- Focus.nvim - Split panes
-- vim.keymap.set('n', '<Space>h', '<cmd>FocusSplitLeft<CR>', { desc = 'Focus Split Left' })
-- vim.keymap.set('n', '<Space>j', '<cmd>FocusSplitDown<CR>', { desc = 'Focus Split Down' })
-- vim.keymap.set('n', '<Space>k', '<cmd>FocusSplitUp<CR>', { desc = 'Focus Split Up' })
-- vim.keymap.set('n', '<Space>l', '<cmd>FocusSplitRight<CR>', { desc = 'Focus Split Right' })
-- vim.keymap.set('n', '<Space>m', '<cmd>FocusMaxOrEqual<CR>', { desc = 'Maximaze or Equalises Split' })

-- Nvim-tree.nvim
-- vim.keymap.set('n', '<Space>e', '<cmd>NvimTreeToggle<cr>', { desc = 'File Browser' })

-- Pounce.nvim
-- vim.keymap.set('n', 'S', '<cmd>Pounce<CR>')
-- vim.keymap.set('v', 'S', '<cmd>Pounce<CR>')

-- Treehopper
vim.keymap.set('o', 'm', [[:<c-u>lua require 'tsht'.nodes()<cr>]], { silent = true, remap = true })
vim.keymap.set('x', 'm', [[:<c-u>lua require 'tsht'.nodes()<cr>]], { silent = true })

-- Lazy nvim
vim.keymap.set('n', '<Leader>la', '<cmd>Lazy<cr>')
