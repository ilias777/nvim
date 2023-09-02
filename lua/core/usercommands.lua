-- Open GitHub Repo from lazy.nvim
-- url: https://github.com/justinsgithub/dotfiles/blob/main/neovim/.config/nvim/lua/user/commands.lua
vim.api.nvim_create_user_command('OpenGithubRepo', function(_)
    local ghpath = vim.api.nvim_eval("shellescape(expand('<cfile>'))")
    local formatpath = ghpath:sub(2, #ghpath - 1)
    local repourl = 'https://www.github.com/' .. formatpath
    vim.fn.system({ 'open', repourl })
end, {
    desc = 'Open Github Repo',
    force = true,
})

-- Cleaning registers
vim.api.nvim_create_user_command('ClearReg', function()
    print('Clearing registers')
    vim.cmd([[
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
        endfor
        ]])
end, {})

-- Set ltex language on the fly
vim.api.nvim_create_user_command('LtexLang', "lua require('core.functions').set_ltex_lang(<q-args>)", { nargs = 1, desc = 'Set ltex-ls language' })
vim.api.nvim_set_keymap('n', '<leader>lx', "<cmd>lua require('core.functions').set_ltex_lang('en')<cr>", { desc = 'Set ltex-ls language' })
