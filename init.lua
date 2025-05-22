require('config.lazy')
require('config.options')
require('config.keymaps')
require('config.autocommands')
require('config.usercommands')
require('utils.init')
require('config.cursor')

require('config.lsp.global')

local lsp_path = vim.fn.stdpath('config') .. '/lua/config/lsp/servers'

for _, file in ipairs(vim.fn.readdir(lsp_path)) do
    if file:match('%.lua$') and file ~= 'global.lua' then
        local module_name = 'config.lsp.servers.' .. file:gsub('%.lua$', '')
        require(module_name)
    end
end
