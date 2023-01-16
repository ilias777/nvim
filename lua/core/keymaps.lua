--  ╭──────────────────────────────────────────────────────────╮
--  │                      BASIC KEYMAPS                       │
--  ╰──────────────────────────────────────────────────────────╯
-- Exit normal mode
vim.keymap.set('i', 'kj', '<esc>')

-- Search key
vim.keymap.set('n', '<Leader>s', '/')
vim.keymap.set('n', '<Leader>S', '?')

-- For correcting a word
vim.keymap.set('i', '<c-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

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

-- Indent lines
vim.api.nvim_set_keymap('v', '<', '<gv', {})
vim.api.nvim_set_keymap('v', '>', '>gv', {})

-- Paste
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('n', 'dD', '"_dd')

-- Not yanking with 'c' and 'x'
vim.keymap.set('n', 'c', '"_c')
-- vim.keymap.set('n', 'x', '"_x')

-- Search and replace word under the cursor
vim.keymap.set('n', '<leader>r', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

--  ╭──────────────────────────────────────────────────────────╮
--  │                 PLUGINS RELATED KEYMAPS                  │
--  ╰──────────────────────────────────────────────────────────╯

-- Buffers
vim.keymap.set('n', '<S-Left>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Buffer Previous' })
vim.keymap.set('n', '<S-Right>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Buffer Next' })

-- Swich split panes with Focus
-- vim.keymap.set('n', '<Space>h', '<cmd>FocusSplitLeft<CR>', { desc = 'Focus Split Left' })
-- vim.keymap.set('n', '<Space>j', '<cmd>FocusSplitDown<CR>', { desc = 'Focus Split Down' })
-- vim.keymap.set('n', '<Space>k', '<cmd>FocusSplitUp<CR>', { desc = 'Focus Split Up' })
-- vim.keymap.set('n', '<Space>l', '<cmd>FocusSplitRight<CR>', { desc = 'Focus Split Right' })
-- vim.keymap.set('n', '<Space>m', '<cmd>FocusMaxOrEqual<CR>', { desc = 'Maximaze or Equalises Split' })

-- NVIM TREE
vim.keymap.set('n', '<Space>e', '<cmd>NvimTreeToggle<cr>', { desc = 'File Browser' })

-- Trouble LSP
-- vim.keymap.set('n', 'gr', '<cmd>TroubleToggle lsp_references<cr>')

-- Pounce
-- vim.keymap.set('n', 'S', '<cmd>Pounce<CR>')
-- vim.keymap.set('v', 'S', '<cmd>Pounce<CR>')

-- Lazy nvim
vim.keymap.set('n', '<Leader><Leader>l', '<cmd>Lazy<cr>')
