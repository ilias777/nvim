return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufReadPost', 'BufNewFile' },
    depedencies = {
        { 'mason-org/mason.nvim' },
        { 'mason-org/mason-lspconfig.nvim' },
        { 'saghen/blink.cmp' },
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup()

        require('config.lsp.global')

        local lsp_path = vim.fn.stdpath('config') .. '/lua/config/lsp/servers'

        for _, file in ipairs(vim.fn.readdir(lsp_path)) do
            if file:match('%.lua$') and file ~= 'global.lua' then
                local module_name = 'config.lsp.servers.' .. file:gsub('%.lua$', '')
                require(module_name)
            end
        end
    end,
}
