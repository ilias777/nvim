-- Search
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Indents, spaces
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- UI
-- vim.opt.background = 'dark'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.o.cmdheight = 0
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars:append({
    tab = '»-',
    trail = '·',
    extends = '»',
    precedes = '«',
})
vim.opt.fillchars:append({
    eob = ' ',
    fold = ' ',
    foldsep = ' ',
    foldopen = '',
    foldclose = '',
    diff = '╱',
})
vim.opt.confirm = true
vim.opt.smoothscroll = true
-- vim.opt.conceallevel = 2
-- vim.opt.pumheight = 10
-- vim.opt.colorcolumn = '100'

-- Text
vim.opt.textwidth = 100
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true
-- vim.opt.encoding = 'utf-8'

-- Folding
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldtext = 'v:lua.vim.treesitter.foldtext()'
-- vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Clipboard
vim.opt.clipboard = 'unnamedplus'

-- Keys
vim.opt.backspace = { 'indent', 'eol', 'start' }
-- vim.opt.mouse = 'nvi'

-- Cursor
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.guicursor = {
    'n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
    'i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
    'r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100',
}

-- Path
vim.opt.path:append('**')

-- Spell
vim.opt.spell = false
vim.opt.spelllang = { 'de' }

-- Split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.undodir')

-- diff
vim.opt.diffopt = { 'internal', 'filler', 'closeoff', 'linematch:40' }

-- Other
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Python
vim.g.python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3'

-- Markdown
vim.g.markdown_fenced_languages = { 'html', 'python', 'lua', 'js=javascript' }

-- Greek langmap
-- stylua: ignore
vim.opt.langmap = 'ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz'

-- Open telescope file_browser if nvim has no arguments
-- if vim.fn.argc() == 0 then
--     vim.defer_fn(function()
--         vim.cmd('Telescope file_browser')
--     end, 0)
-- end

-- For treesitter commentstring
vim.opt.updatetime = 100
vim.g.skip_ts_context_commentstring_module = true

-- Disable providers for health checks
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Disable depreceted messages
-- vim.deprecate = function() end ---@diagnostic disable-line: duplicate-set-field
