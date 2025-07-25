local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = ','
vim.g.maplocalleader = ','

require('config.options')
require('config.keymaps')
require('config.autocommands')
require('config.usercommands')

local opts = {
    ui = {
        border = 'single',
        icons = {
            lazy = '💤',
        },
    },
    checker = {
        enabled = true,
    },
}

require('lazy').setup({ import = 'plugins' }, opts)

require('utils.init')
require('config.cursor')
