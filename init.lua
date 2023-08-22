local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ','
vim.g.maplocalleader = ','

require('core.options')
require('core.keymaps')
require('core.autocommands')
require('core.usercommands')

local opts = {
    ui = {
        border = 'rounded',
        icons = {
            lazy = '💤',
        },
    },
    checker = {
        enabled = true,
        concurrency = 100,
    },
}

require('lazy').setup('plugins', opts)
