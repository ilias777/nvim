local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable', -- latest stable release
        lazyrepo,
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = ','
vim.g.maplocalleader = ','

require('core.options')
require('core.keymaps')
require('core.autocommands')
require('core.usercommands')

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

require('lazy').setup({ { import = 'plugins' }, { import = 'plugins.lsp' } }, opts)
