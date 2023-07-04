return {
    'folke/which-key.nvim',
    event = 'BufReadPre',
    enabled = true,
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        require('which-key').setup()
        local wk = require('which-key')
        wk.register({
            --  ╭──────────────────────────────────────────────────────────╮
            --  │                        LEADER KEY                        │
            --  ╰──────────────────────────────────────────────────────────╯

            -- Comment Frame & Comment Box
            ['<leader>c'] = { name = '+Comment Frame/Box' },

            -- Dap
            ['<leader>d'] = { name = '+Debug' },
            ['<leader>dB'] = { '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', 'Add Conditional Breakpoint' },
            ['<leader>dc'] = { '<cmd>DapContinue<CR>', 'Dap Continue' },
            ['<leader>di'] = { '<cmd>DapStepInto<CR>', 'Dap Step Into' },
            ['<leader>do'] = { '<cmd>DapStepOver<CR>', 'Dap Step Over' },
            ['<leader>ds'] = { '<cmd>DapStepOut<CR>', 'Dap Step Out' },
            ['<leader>dt'] = { '<cmd>DapTerminate<CR>', 'Dap Terminate' },
            ['<leader>dl'] = { '<cmd>DapShowLog<CR>', 'Dap Show Log' },
            ['<leader>dr'] = { '<cmd>DapToggleRepl<CR>', 'Dap Toggle Repl' },
            -- ['<leader>db'] = { '<cmd>DapToggleBreakpoint<CR>', 'Add Breakpoint' },
            -- ['<leader>du'] = { '<cmd>lua require("dapui").toggle()<CR>', 'Dap UI Toggle' },

            -- Telescope
            ['<leader>f'] = { name = '+File' },
            ['<leader>fc'] = { ":lua require'telescope.builtin'.commands{}<cr>", 'List Commands' },
            ['<leader>fd'] = { '<cmd>Telescope diagnostics<cr>', 'List Diagnostics' },
            ['<leader>fj'] = { '<cmd>Telescope emoji<cr>', 'Find emoji' },
            ['<leader>fn'] = { '<cmd>Noice telescope<cr>', 'List Noice notifications' },
            ['<leader>fo'] = { '<cmd>Telescope oldfiles<cr>', 'Recently opened files' },
            ['<leader>fs'] = { '<cmd>Telescope symbols<cr>', 'Find Symbols' },
            ['<leader>fr'] = { ':lua require"telescope.builtin".registers{}<cr>', 'List Registers' },
            -- ['<leader>fk'] = { '<cmd>Telescope keymaps<cr>', 'Find keymap' },
            -- ['<leader>fb'] = { '<cmd>Telescope buffers<cr>', 'Find Buffers' },
            -- ['<leader>fe'] = { '<cmd>Telescope file_browser<cr>', 'Browse Files' },
            -- ['<leader>ff'] = { '<cmd>Telescope find_files<cr>', 'Find File' },
            -- ['<leader>fg'] = { '<cmd>Telescope live_grep<cr>', 'Find Word' },
            -- ['<leader>fh'] = { '<cmd>Telescope help_tags<cr>', 'Find Help' },

            -- Git
            ['<leader>g'] = { name = '+Git' },
            ['<leader>go'] = { '<cmd>DiffviewOpen<cr>', 'Open Diffview' },
            ['<leader>gc'] = { '<cmd>DiffviewClose<cr>', 'Close Diffview' },
            -- ['<leader>gg'] = { '<cmd>Neogit<cr>', 'Neogit' },

            -- Hop
            ['<leader>h'] = { name = 'Hunk Gitsigns/Hop Motion' },
            ['<leader>hl'] = { '<cmd>HopLine<cr>', 'Hop Line' },
            ['<leader>h1'] = { '<cmd>HopChar1<cr>', 'Hop 1 Char' },
            ['<leader>h2'] = { '<cmd>HopChar2<cr>', 'Hop 2 Chars' },
            ['<leader>hv'] = { '<cmd>HopVertical<cr>', 'Hop Vertical' },
            -- ['<leader>hp'] = { '<cmd>HopPattern<cr>', 'Hop Pattern' },
            -- ['<leader>ha'] = { '<cmd>HopAnywhere<cr>', 'Hop Anywhere' },
            -- ['<leader>a'] = { '<cmd>HopWord<cr>', 'Hop Word' },

            -- Gitsigns
            ['<leader>t'] = { name = '+Toggle' },

            -- Symbols Outline
            -- ['<leader>o'] = { '<cmd>SymbolsOutline<cr>', 'Symbols Outline Toggle' },

            -- Trouble
            ['<leader>x'] = { name = '+Trouble' },
            ['<leader>xw'] = { '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>', 'Trouble Workspace Diagnostics' },
            ['<leader>xd'] = { '<cmd>TroubleToggle lsp_document_diagnostics<cr>', 'Trouble Document Diagnostics' },
            ['<leader>xl'] = { '<cmd>TroubleToggle loclist<cr>', 'Trouble Location List' },
            ['<leader>xq'] = { '<cmd>TroubleToggle quickfix<cr>', 'Trouble Quickfix' },
            -- ['<leader>xx'] = { '<cmd>TroubleToggle<cr>', 'Trouble Toggle' },

            --  ╭──────────────────────────────────────────────────────────╮
            --  │                        SPACE KEY                         │
            --  ╰──────────────────────────────────────────────────────────╯

            -- Bufferline
            ['<space>b'] = { name = '+Buffer' },
            ['<space>bp'] = { '<cmd>BufferLineTogglePin<cr>', 'Pin Buffer' },
            ['<space>bk'] = { '<cmd>BufferLinePick<cr>', 'Pick Buffer' },
            ['<space>b<left>'] = { '<cmd>BufferLineMovePrev<cr>', 'Move Buffer to the left' },
            ['<space>b<right>'] = { '<cmd>BufferLineMoveNext<cr>', 'Move Buffer to the right' },
            ['<space>b1'] = { '<cmd>BufferLineGoToBuffer 1<cr>', 'Go to Buffer 1' },
            ['<space>b2'] = { '<cmd>BufferLineGoToBuffer 2<cr>', 'Go to Buffer 2' },
            ['<space>b3'] = { '<cmd>BufferLineGoToBuffer 3<cr>', 'Go to Buffer 3' },
            ['<space>b4'] = { '<cmd>BufferLineGoToBuffer 4<cr>', 'Go to Buffer 4' },
            ['<space>b5'] = { '<cmd>BufferLineGoToBuffer 5<cr>', 'Go to Buffer 5' },
            ['<space>b6'] = { '<cmd>BufferLineGoToBuffer 6<cr>', 'Go to Buffer 6' },
            ['<space>b7'] = { '<cmd>BufferLineGoToBuffer 7<cr>', 'Go to Buffer 7' },
            ['<space>b8'] = { '<cmd>BufferLineGoToBuffer 8<cr>', 'Go to Buffer 8' },
            ['<space>b9'] = { '<cmd>BufferLineGoToBuffer 9<cr>', 'Go to Buffer 9' },
            -- ['<space>bd'] = { '<cmd>Bdelete<cr>', 'Delete Buffer' },

            -- Code Actions with LSP
            ['<space>c'] = { name = '+Code actions / Cheatsheet' },

            -- Messages
            -- ['<leader>m'] = { '<cmd>messages<cr>', 'Show Messages' },

            -- Noice
            ['<space>n'] = { name = '+Noice' },
            ['<space>nn'] = { '<cmd>Noice<cr>', 'Noice Messages' },
            ['<space>nd'] = { '<cmd>NoiceDismiss<cr>', 'Noice Dismiss' },
            ['<space>nl'] = { '<cmd>NoiceLast<cr>', 'Noice Last' },
            ['<space>nt'] = { '<cmd>NoiceTelescope<cr>', 'Noice Telescope' },

            -- Workspace LSP
            ['<space>w'] = { name = '+Workspace LSP' },

            -- Rename with LSP
            ['<space>r'] = { name = '+Rename with LSP' },
        })
    end,
}
