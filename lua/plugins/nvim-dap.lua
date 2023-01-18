return {
    'mfussenegger/nvim-dap',
    keys = {
        { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = 'Add Breakpoint' },
    },
    config = function()
        -- Signs
        local sign = vim.fn.sign_define
        -- 
        sign('DapBreakpoint', { text = ' ', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
        sign('DapBreakpointCondition', { text = '●', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
        sign('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })

        local dap = require('dap')

        --  ╭──────────────────────────────────────────────────────────╮
        --  │                       PYTHON DEBUG                       │
        --  ╰──────────────────────────────────────────────────────────╯
        dap.adapters.python = {
            type = 'executable',
            command = '/opt/homebrew/lib/python3.10/site-packages/debugpy/bin/python3',
            args = { '-m', 'debugpy.adapter' },
        }
        dap.configurations.python = {
            {
                -- The first three options are required by nvim-dap
                type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
                request = 'launch',
                name = 'Launch file',

                -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

                program = '${file}', -- This configuration will launch the current file if used.
                pythonPath = function()
                    -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                    -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                    -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. '/opt/homebrew/lib/python3.10/site-packages/debugpy/bin/python3') == 1 then
                        return cwd .. '/opt/homebrew/lib/python3.10/site-packages/debugpy/bin/python3'
                    elseif vim.fn.executable(cwd .. '/opt/homebrew/lib/python3.10/site-packages/debugpy/bin/python3') == 1 then
                        return cwd .. '/opt/homebrew/lib/python3.10/site-packages/debugpy/bin/python3'
                    else
                        return '/opt/homebrew/lib/python3.10/site-packages/debugpy/bin/python3'
                    end
                end,
            },
        }
        --  ╭──────────────────────────────────────────────────────────╮
        --  │                        RUST DEBUG                        │
        --  ╰──────────────────────────────────────────────────────────╯
        dap.adapters.lldb = {
            type = 'executable',
            command = '/opt/homebrew/opt/llvm/bin/lldb-vscode', -- adjust as needed, must be absolute path
            name = 'lldb',
        }
        dap.configurations.rust = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/' .. 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},

                -- 💀
                -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
                --
                --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
                --
                -- Otherwise you might get the following error:
                --
                --    Error on launch: Failed to attach to the target process
                --
                -- But you should be aware of the implications:
                -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
                -- runInTerminal = false,
                showDisassembly = 'never',
                -- vim.fn.jobstart('cargo build'),
            },
        }
    end,
}
