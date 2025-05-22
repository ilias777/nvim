local M = {}

function M.set()
    vim.diagnostic.config({
        virtual_text = {
            prefix = '', -- Could be '●', '▎', │, 'x', '■', , 
        },
        jump = {
            float = true,
        },
        float = { border = 'single' },
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = ' ',
                [vim.diagnostic.severity.WARN] = ' ',
                [vim.diagnostic.severity.HINT] = '󰌶 ',
                [vim.diagnostic.severity.INFO] = ' ',
            },
            numhl = {
                [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
                [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
                [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
                [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
            },
        },
    })
end

return M
