local M = {}

-- Toggle split window from equalize to maximize
M.max_or_equal = function()
    local winwidth = vim.fn.winwidth(vim.api.nvim_get_current_win())
    if winwidth <= vim.o.columns / 2 then
        vim.cmd('wincmd|')
    else
        vim.cmd('wincmd=')
    end
end

return M
