vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.hidden = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.mouse = 'nvi'
vim.opt.background = 'dark'
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
-- vim.opt.colorcolumn = '100'
vim.opt.textwidth = 100
vim.opt.laststatus = 3
vim.o.cmdheight = 0
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.foldmethod = 'indent'
-- vim.opt.foldenable = true
-- vim.opt.foldmarker = '{{{,}}}'
--
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 10
vim.opt.list = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.wrap = false
vim.opt.spell = false
vim.opt.spelllang = { 'de' }
-- vim.opt.spelllang = { 'en_us' }
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.syntax = 'enable'
vim.opt.encoding = 'utf-8'
vim.opt.listchars:append({ tab = '»-' })
vim.opt.listchars:append({ trail = '·' })
vim.opt.listchars:append({ extends = '»' })
vim.opt.listchars:append({ precedes = '«' })
-- eob: ,fold: ,foldopen:,foldsep: ,foldclose:
vim.opt.fillchars:append({ eob = ' ', fold = ' ', foldsep = ' ', foldopen = '', foldclose = '' })
-- vim.opt.fillchars:append({ eob = ' ', fold = ' ', foldsep = ' ', foldopen = ' ', foldclose = ' ' })
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = 'yes:1'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3'
vim.g.markdown_fenced_languages = { 'html', 'python', 'lua', 'js=javascript' }
vim.opt.langmap = 'ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz'

-- Open telescope file_browser if nvim has no arguments
-- if vim.fn.argc() == 0 then
--     vim.defer_fn(function()
--         vim.cmd('Telescope file_browser')
--     end, 0)
-- end
