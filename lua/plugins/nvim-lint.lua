return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')
        lint.linters_by_ft = {
            javascript = { 'eslint' },
            json = { 'jsonlint' },
            vue = { 'eslint' },
            yaml = { 'yamllint' },
            markdown = { 'rumdl' },
        }
        lint.linters.rumdl = {
            cmd = 'rumdl',
            stdin = false, -- inconsistent if set to true
            args = { 'check' },
            stream = 'stdout',
            ignore_exitcode = true,
            env = nil,
            parser = require('lint.parser').from_pattern('([^:]+):(%d+):(%d+): %[([^%]]+)%] (.+)', {
                'file',
                'lnum',
                'col',
                'code',
                'message',
            }, {
                -- severity mapping -> useful if integrated with note taking tools eg markdown-oxide
            }, {
                source = 'rumdl',
                severity = vim.diagnostic.severity.WARN,
            }),
        }
        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
