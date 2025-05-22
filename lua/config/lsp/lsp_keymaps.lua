local keymap = require('utils.set_keymap')

local M = {}

function M.set()
    keymap.set({
        key = 'K',
        cmd = function()
            vim.lsp.buf.hover({ border = 'single' })
        end,
        desc = 'Hover',
    })
    keymap.set({
        mode = { 'n', 'v' },
        key = 'gra',
        cmd = vim.lsp.buf.code_action,
        desc = 'LSP Code Action',
    })
    keymap.set({
        key = 'grn',
        cmd = vim.lsp.buf.rename,
        desc = 'LSP Rename',
    })
    keymap.set({
        key = 'grr',
        cmd = vim.lsp.buf.references,
        desc = 'LSP References',
    })
    keymap.set({
        key = 'grd',
        cmd = vim.lsp.buf.definition,
        desc = 'LSP Go to Definition',
    })
    keymap.set({
        key = 'grD',
        cmd = vim.lsp.buf.declaration,
        desc = 'LSP Go to Declaration',
    })
    keymap.set({
        key = 'gri',
        cmd = vim.lsp.buf.implementation,
        desc = 'LSP Go to Implementation',
    })
    keymap.set({
        key = 'grf',
        cmd = function()
            vim.lsp.buf.format({ async = true })
        end,
        desc = 'LSP Formatting',
    })
    keymap.set({
        key = 'grk',
        cmd = function()
            vim.lsp.buf.signature_help({ border = 'single' })
        end,
        desc = 'LSP Singature Help',
    })
    keymap.set({
        key = 'grs',
        cmd = vim.lsp.buf.document_symbol,
        desc = 'LSP Document Symbols',
    })
    keymap.set({
        key = 'grt',
        cmd = vim.lsp.buf.type_definition,
        desc = 'LSP Type Definition',
    })
    keymap.set({
        key = 'grwa',
        cmd = vim.lsp.buf.add_workspace_folder,
        desc = 'LSP Add Workspace Folder',
    })
    keymap.set({
        key = 'grwr',
        cmd = vim.lsp.buf.remove_workspace_folder,
        desc = 'LSP Remove Workspace Folder',
    })
    keymap.set({
        key = 'grwl',
        cmd = function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        desc = 'LSP List Workspace Folder',
    })
end

return M
