vim.lsp.config.tinymist = {
    on_attach = function(client, bufnr)
        -- Pin main file user command
        vim.api.nvim_create_user_command('PinMain', function()
            client:exec_cmd({
                title = 'Pin',
                command = 'tinymist.pinMain',
                arguments = { vim.api.nvim_buf_get_name(0) },
            }, { bufnr = bufnr })
        end, {})
        -- Unpin main file user command
        vim.api.nvim_create_user_command('UnpinMain', function()
            client:exec_cmd({
                title = 'Unpin',
                command = 'tinymist.pinMain',
                arguments = { vim.v.null },
            }, { bufnr = bufnr })
        end, {})
        -- Use buildin preview command
        vim.api.nvim_create_user_command('TypstBuildInPreview', function()
            client:exec_cmd({ command = 'tinymist.startDefaultPreview', arguments = { nil } }, { bufnr = bufnr })
        end, {})
        -- Open PDF
        vim.api.nvim_create_user_command('OpenPdf', function()
            local filepath = vim.api.nvim_buf_get_name(0)
            if filepath:match('%.typ$') then
                os.execute('open ' .. vim.fn.shellescape(filepath:gsub('%.typ$', '.pdf')))
            end
        end, {})
    end,
    settings = {
        formatterMode = 'typstyle',
        exportPdf = 'onSave',
        invert_colors = 'auto',
        lint = 'enable',
    },
}

vim.lsp.enable('tinymist')
